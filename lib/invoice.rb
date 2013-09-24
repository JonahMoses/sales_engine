class Invoice
  
  attr_reader :invoice_id, 
              :invoice_customer_id, 
              :invoice_merchant_id,
              :invoice_status, 
              :invoice_merchant_id,                
              :invoice_created_at, 
              :invoice_updated_at                              
  
  def initialize(invoice_attribute)
    @invoice_id          = invoice_attribute[:id]                                    
    @invoice_customer_id = invoice_attribute[:customer_id]                            
    @invoice_merchant_id = invoice_attribute[:merchant_id] 
    @invoice_status      = invoice_attribute[:status]                                   
    @invoice_created_at  = invoice_attribute[:created_at]    
    @invoice_updated_at  = invoice_attribute[:updated_at]    
  end

end
