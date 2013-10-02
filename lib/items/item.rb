class Item

  attr_reader :id, 
              :name, 
              :description, 
              :unit_price, 
              :merchant_id, 
              :created_at, 
              :updated_at,
              :engine

  def initialize(item_attributes = {}, engine)
    @id          = item_attributes[:id].to_s
    @name        = item_attributes[:name].to_s
    @description = item_attributes[:description].to_s
    @unit_price  = BigDecimal.new(item_attributes[:unit_price])
    @merchant_id = item_attributes[:merchant_id].to_s
    @created_at  = item_attributes[:created_at].to_s
    @updated_at  = item_attributes[:updated_at].to_s
    @engine      = engine    
  end

  def invoice_items
    engine.invoice_item_repository.find_all_by_item_id(self.id)
  end

  def merchant
    engine.merchant_repository.find_by_id(self.merchant_id)
  end

  def revenue(date = nil)
    if date.nil?
      estimate_revenue(successful_invoices)
    else
      estimate_revenue(invoices_by_date(date))
    end
  end

  def quantity_sold
    invoice_items.collect do |invoice_item|
      invoice_item.quantity if invoice_item.invoice.successful?
    end.compact.reduce(0, :+)
  end

  def successful_invoices
    engine.invoice_repository.invoices.select { |invoice| invoice.successful? }
  end

  def best_day
    dates = successful_invoices.collect { |successful_invoices| successful_invoices.created_at }.uniq
    dates.max_by { |date| revenue(date) }
  end

private

  def invoices_by_date(date)
    successful_invoices.select do |invoice|
      invoice.created_at == date
    end
  end

  def estimate_revenue(invoices)
    invoices.collect do |invoice|
      invoice.total_prices.to_i
    end.reduce(0, :+)
  end

end
