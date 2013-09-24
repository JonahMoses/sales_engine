gem "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/merchant"
require "csv"

class MerchantTest < Minitest::Test

  def contents
    contents = CSV.read "./data/merchants.csv", headers: true, header_converters: :symbol
  end

  def merchant_attributes
    contents.each do |row|
      merchant_id = row[:id]
      merchant_name = row[:name]
      created_at = row[:created_at]
      updated_at = row[:updated_at]
    end
  end

  def merchant
    merchant = Merchant.new(merchant_attributes)
  end

  def test_merchant_id
    assert_equal merchant_attributes[:id], merchant.merchant_id
  end

  def test_merchant_name
    assert_equal merchant_attributes[:name], merchant.merchant_name
  end  

  def test_merchant_created_at
    assert_equal merchant_attributes[:created_at], merchant.merchant_created_at
  end

  def test_merchant_updated_at
    assert_equal merchant_attributes[:updated_at], merchant.merchant_updated_at
  end

end

