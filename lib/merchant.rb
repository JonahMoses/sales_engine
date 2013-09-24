class Merchant

  attr_reader :merchant_id,
              :merchant_name,
              :merchant_created_at,
              :merchant_updated_at

  def initialize(attribute = {})
    @merchant_id         = attribute[:id]
    @merchant_name       = attribute[:name]
    @merchant_created_at = attribute[:created_at]
    @merchant_updated_at = attribute[:updated_at]
  end

end
