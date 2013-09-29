class Invoice
  
  attr_reader :id, 
              :customer_id, 
              :merchant_id,
              :status, 
              :created_at, 
              :updated_at                              
  
  def initialize(invoice_attribute)
    @id          = invoice_attribute[:id]                                    
    @customer_id = invoice_attribute[:customer_id]                            
    @merchant_id = invoice_attribute[:merchant_id] 
    @status      = invoice_attribute[:status]                                   
    @created_at  = invoice_attribute[:created_at]    
    @updated_at  = invoice_attribute[:updated_at]    
  end

  def transactions
    TransactionRepo.new.find_all_by_invoice_id(self.id)
  end

  def invoice_items
    InvoiceItemRepo.new.find_all_by_invoice_id(self.id)
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
    CustomerRepo.new.find_by_id(self.customer_id)
  end

  def merchant
    MerchantRepo.new.find_by_id(self.merchant_id)
  end
end
