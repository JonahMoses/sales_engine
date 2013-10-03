class Merchant

  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :revenue,
              :engine

  def initialize(attribute = {}, engine)
    @id         = attribute[:id].to_s
    @name       = attribute[:name].to_s
    @created_at = attribute[:created_at].to_s
    @updated_at = attribute[:updated_at].to_s
    @engine     = engine
  end

  def items
    engine.item_repository.find_all_by_merchant_id(self.id)
  end

  def invoices
    engine.invoice_repository.find_all_by_merchant_id(self.id)
  end

  def successful_invoices
    invoices.select { |invoice| invoice.successful? }
  end

  def revenue(date = nil)
    if date.nil?
      estimate_revenue(successful_invoices)
    else
      estimate_revenue(invoices_by_date(date))
    end
  end

  def favorite_customer
    counts = Hash.new(0)
    successful_invoices.each_with_object(counts) { |invoice| counts[invoice.customer] +=1 }
    counts.sort_by{ |customer, count| count }.reverse.flatten.first
  end

  def customers_with_pending_invoices
    pending_invoices.collect { |invoice| invoice.customer }
  end

private

  def invoices_by_date(date)
    successful_invoices.select do |invoice|
      invoice.created_at == date
    end
  end

  def estimate_revenue(invoices)
    invoices.collect do |invoice|
      invoice.total_prices
    end.reduce(0, :+)
  end

  def pending_invoices
    invoices - successful_invoices
  end

end
