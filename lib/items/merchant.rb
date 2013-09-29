class Merchant

  attr_reader :id,
              :name,
              :created_at,
              :updated_at

  def initialize(attribute = {})
    @id         = attribute[:id]
    @name       = attribute[:name]
    @created_at = attribute[:created_at]
    @updated_at = attribute[:updated_at]
  end

  def items
    ItemRepo.new.find_all_by_merchant_id(self.id)
  end

  def invoices
    InvoiceRepo.new.find_all_by_merchant_id(self.id)
  end
  
end
