require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/items/merchant"

class MerchantTest < Minitest::Test

  def merchant_attributes
    {id: "1", name: "Jonah", created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC"}
  end

  def merchant
    merchant = Merchant.new(merchant_attributes)
  end

  def test_merchant_id
    assert_equal "1", merchant.id
  end

  def test_merchant_name
    assert_equal "Jonah", merchant.name
  end  

  def test_merchant_created_at
    assert_equal "2012-03-27 14:53:59 UTC", merchant.created_at
  end

  def test_merchant_updated_at
    assert_equal "2012-03-27 14:53:59 UTC", merchant.updated_at
  end

end

