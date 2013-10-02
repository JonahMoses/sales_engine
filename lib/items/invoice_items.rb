class InvoiceItems

  attr_reader :id,
              :item_id, 
              :invoice_id, 
              :quantity, 
              :unit_price, 
              :created_at, 
              :updated_at,
              :engine

  def initialize(item_attributes, engine)
    @id         = item_attributes[:id].to_s
    @item_id    = item_attributes[:item_id].to_s
    @invoice_id = item_attributes[:invoice_id].to_s
    @quantity   = item_attributes[:quantity].to_i
    @unit_price = BigDecimal.new(item_attributes[:unit_price])
    @created_at = item_attributes[:created_at].to_s
    @updated_at = item_attributes[:updated_at].to_s
    @engine     = engine
  end

  def invoice
    engine.invoice_repository.find_by_id(self.invoice_id)
  end

  def item
    engine.item_repository.find_by_id(self.item_id)
  end

  def total_price
    quantity * unit_price
  end
end
