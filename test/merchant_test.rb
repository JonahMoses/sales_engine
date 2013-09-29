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



end
