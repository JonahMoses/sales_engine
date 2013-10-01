class Invoice
  
  attr_reader :id, 
              :customer_id, 
              :merchant_id,
              :status, 
              :created_at, 
              :updated_at,
              :total,
              :engine                             
  
  def initialize(invoice_attribute, engine)
    @id          = invoice_attribute[:id].to_s                              
    @customer_id = invoice_attribute[:customer_id].to_s                            
    @merchant_id = invoice_attribute[:merchant_id].to_s 
    @status      = invoice_attribute[:status].to_s                                   
    @created_at  = invoice_attribute[:created_at].to_s    
    @updated_at  = invoice_attribute[:updated_at].to_s   
    @engine = engine 
  end

  def transactions
    engine.transaction_repository.find_all_by_invoice_id(self.id)
  end

  def invoice_items
    engine.invoice_item_repository.find_all_by_invoice_id(self.id)
  end

  def items
    items = invoice_items.collect do |invoice_item|
      invoice_item.item
    end
    items.compact
    # after refactoring: 
    # invoice_items.collect(&:item).compact
  end

  def customer
    engine.customer_repository.find_by_id(self.customer_id)
  end

  def merchant
    engine.merchant_repository.find_by_id(self.merchant_id)
  end

  def total_prices
    self.invoice_items.collect do |item|
      item.unit_price.to_i * item.quantity.to_i
    end.reduce(:+)
  end

  def successful?
    self.transactions.any? do |transaction|
      transaction.result == "success"
    end
  end

end
