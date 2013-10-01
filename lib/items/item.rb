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

end
