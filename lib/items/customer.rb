class Customer

  attr_reader :id,
              :first_name,
              :last_name,
              :created_at,
              :updated_at,
              :engine

  def initialize(customer_attribute, engine)
    @id         = customer_attribute[:id].to_s
    @first_name = customer_attribute[:first_name].to_s
    @last_name  = customer_attribute[:last_name].to_s
    @created_at = customer_attribute[:created_at].to_s
    @updated_at = customer_attribute[:updated_at].to_s
    @engine     = engine
  end

  def invoices
    engine.invoice_repository.find_all_by_customer_id(self.id)
  end

  def successful_invoices
    invoices.select { |invoice| invoice.successful? }
  end

  def favorite_merchant
    counts = Hash.new(0)
    successful_invoices.each_with_object(counts) { |merchant| counts[merchant.id] +=1 }
    counts.sort_by{ |merchants, count| count }.reverse.flatten.first
  end

end
