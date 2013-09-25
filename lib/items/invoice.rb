class Invoice
  
  attr_reader :id, 
              :customer_id, 
              :merchant_id,
              :status, 
              :merchant_id,                
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

end
