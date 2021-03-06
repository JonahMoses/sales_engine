require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/items/item'
require "./lib/sales_engine"

class ItemTest < MiniTest::Test 

  attr_reader :item_repo,
              :engine
  
  def setup
    @engine = SalesEngine.new
    @item_repo = engine.item_repository
  end

  def item
    item ||= item_repo.items.first
  end

  def test_item_id
    assert_equal "1", item.id
  end

  def test_name
    assert_equal "Item Qui Esse", item.name
  end

  def test_description
    assert_equal "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.", item.description
  end

  def test_unit_price
    assert_equal 75107, item.unit_price.to_i
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
    assert_equal 24, item.invoice_items.size
  end

  def test_each_item_returns_a_merchant
    assert_kind_of Merchant, item.merchant
  end

  def test_revenue
    assert_equal 5749357487, item.revenue
  end

  def test_quantity_sold
    assert_equal 109, item.quantity_sold
  end

  def test_best_day
    assert_equal "2012-03-20 20:57:24 UTC", item.best_day
  end

end
