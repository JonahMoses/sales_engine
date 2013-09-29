class Item

  attr_reader :id, 
              :name, 
              :description, 
              :unit_price, 
              :merchant_id, 
              :created_at, 
              :updated_at

  def initialize(item_attributes = {})
    @id          = item_attributes[:id]
    @name        = item_attributes[:name]
    @description = item_attributes[:description]
    @unit_price  = item_attributes[:unit_price]
    @merchant_id = item_attributes[:merchant_id]
    @created_at  = item_attributes[:created_at]
    @updated_at  = item_attributes[:updated_at]
  end

  def invoice_items
    InvoiceItemRepo.new.find_all_by_item_id(self.id)
  end

  def merchant
    MerchantRepo.new.find_by_id(self.merchant_id)
  end

end
