require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/items/merchant"
require "./lib/sales_engine"

class MerchantTest < Minitest::Test

  attr_reader :merchant_repo,
              :engine
  
  def setup
    @engine = SalesEngine.new
    @merchant_repo = engine.merchant_repository
  end

  def merchant
    merchant ||= merchant_repo.merchants.first
  end

  def test_merchant_id
    assert_equal "1", merchant.id
  end

  def test_merchant_name
    assert_equal "Schroeder-Jerde", merchant.name
  end  

  def test_merchant_created_at
    assert_equal "2012-03-27 14:53:59 UTC", merchant.created_at
  end

  def test_merchant_updated_at
    assert_equal "2012-03-27 14:53:59 UTC", merchant.updated_at
  end

  def test_it_returns_collection_of_item_instances
    assert_kind_of Array, merchant.items 
  end

  def test_each_item_in_the_items_array_is_an_item
    merchant.items.each do |item|
      assert_kind_of Item, item
    end
  end

  def test_it_returns_collection_of_invoice_instances
    assert_kind_of Array, merchant.invoices
  end

  def test_each_invoice_in_the_invoices_array_is_an_invoice
    merchant.invoices.each do |invoice|
      assert_kind_of Invoice, invoice
    end
  end

  def test_revenue
    assert_equal 52877464, merchant.revenue
  end

  def test_revenue_by_date
    date = "2012-03-25 09:54:09 UTC"
    assert_equal 0, merchant.revenue(date)
  end


end

