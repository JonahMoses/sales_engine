class InvoiceItems

  attr_reader :invoice_item_id,
              :item_id, 
              :invoice_id, 
              :quantity, 
              :unit_price, 
              :created_at, 
              :updated_at

  def initialize(item_attributes)
    @invoice_item_id = item_attributes[:id]
    @item_id         = item_attributes[:item_id]
    @invoice_id      = item_attributes[:invoice_id]
    @quantity        = item_attributes[:quantity]
    @unit_price      = item_attributes[:unit_price]
    @created_at      = item_attributes[:created_at]
    @updated_at      = item_attributes[:updated_at]
  end

end
