require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/items/item'

class ItemTest < MiniTest::Test 

  def item_attributes
    {id: "1", name: "Jonah", description: "item", unit_price: "75107", merchant_id: "1", created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC"}
  end

  def item
    item ||= Item.new(item_attributes)
  end

  def test_item_id
    assert_equal "1", item.id
  end

  def test_name
    assert_equal "Jonah", item.name
  end

  def test_description
    assert_equal "item", item.description
  end

  def test_unit_price
    assert_equal "75107", item.unit_price
  end

  def test_merchant_id
    assert_equal "1", item.merchant_id
  end

  def test_created_at
    assert_equal "2012-03-27 14:53:59 UTC", item.created_at
  end

  def test_updated_at
    assert_equal "2012-03-27 14:53:59 UTC", item.updated_at
  end

  def test_each_item_returns_a_collection_of_invoice_items
    assert_kind_of Array, item.invoice_items
    assert_equal item.invoice_items.size, 1
  end

  def test_each_item_returns_a_merchant
    assert_kind_of Merchant, item.merchant
  end

end
