class Merchant

  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :engine

  def initialize(attribute = {}, engine)
    @id         = attribute[:id].to_s
    @name       = attribute[:name].to_s
    @created_at = attribute[:created_at].to_s
    @updated_at = attribute[:updated_at].to_s
    @engine = engine  
  end

  def items
    engine.item_repository.find_all_by_merchant_id(self.id)
  end

  def invoices
    engine.invoice_repository.find_all_by_merchant_id(self.id)
  end

  # def revenue
    
  # end

  # def most_revenue(quantity)

  # end
  
end
