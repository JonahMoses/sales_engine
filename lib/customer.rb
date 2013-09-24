class Customer
  attr_reader :customer_id,
              :first_name,
              :last_name,
              :created_at,
              :updated_at

  def initialize(customer_attribute)
    @customer_id = customer_attribute[:id]
    @first_name  = customer_attribute[:first_name]
    @last_name   = customer_attribute[:last_name]
    @created_at  = customer_attribute[:created_at]
    @updated_at  = customer_attribute[:updated_at]
  end

end
