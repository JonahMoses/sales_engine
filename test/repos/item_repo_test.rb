require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/sales_engine"
require "./lib/repos/item_repo"
require "csv"

class ItemRepoTest < Minitest::Test

  attr_reader :item_repo,
              :engine
  
  def setup
    @engine = SalesEngine.new
    @item_repo = engine.item_repository
  end

  def test_it_gets_filename
    assert_equal './data/items.csv', @item_repo.filename
  end

  def test_it_loads_file_and_creates_items
    items = item_repo.items
    assert_equal '1', items.first.id
  end

  def test_define_method_find_by_id
    item = item_repo.find_by_id("1")
    assert_equal "1", item.id
  end

  def test_define_method_find_by_name
    item = item_repo.find_by_name("Item Qui Esse")
    assert_equal "Item Qui Esse", item.name
  end

  def test_define_method_find_by_description
    item = item_repo.find_by_description("Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.")
    assert_equal "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.", item.description
  end

  def test_define_method_find_by_unit_price
    item = item_repo.find_by_unit_price(BigDecimal.new(75107))
    assert_equal BigDecimal.new(75107), item.unit_price
  end

  def test_define_method_find_by_merchant_id
    item = item_repo.find_by_merchant_id("1")
    assert_equal "1", item.merchant_id
  end

  def test_define_method_find_by_created_at
    item = item_repo.find_by_created_at("2012-03-27 14:53:59 UTC")
    assert_equal "2012-03-27 14:53:59 UTC", item.created_at
  end

  def test_define_method_find_by_updated_at
    item = item_repo.find_by_updated_at("2012-03-27 14:53:59 UTC")
    assert_equal "2012-03-27 14:53:59 UTC", item.updated_at
  end
  
  def test_define_method_find_all_by_id
    item = item_repo.find_all_by_id("1")
    assert_equal 1, item.count
  end

  def test_define_method_find_all_by_name
    item = item_repo.find_all_by_name("Item Qui Esse")
    assert_equal 1, item.count
  end

  def test_define_method_find_all_by_description
    item = item_repo.find_all_by_description("Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.")
    assert_equal 1, item.count
  end

  def test_define_method_find_all_by_unit_price
    item = item_repo.find_all_by_unit_price(BigDecimal.new(75107))
    assert_equal 2, item.count
  end  

  def test_define_method_find_all_by_merchant_id
    item = item_repo.find_all_by_merchant_id("1")
    assert_equal 15, item.count
  end

  def test_define_method_find_all_by_created_at
    item = item_repo.find_all_by_created_at("2012-03-27 14:53:59 UTC")
    assert_equal 170, item.count
  end

  def test_define_method_find_all_by_updated_at
    item = item_repo.find_all_by_updated_at("2012-03-27 14:53:59 UTC")
    assert_equal 170, item.count
  end

  def test_random_merchant
    item_one = @item_repo.random
    item_two = @item_repo.random
    10.times do
      break if item_one.id != item_two.id
      item_two = @item_repo.random
    end
    refute_equal item_one, item_two
  end
  
  def test_all_things_in_repository
    items = item_repo.all
    assert_equal 2483, items.count
  end

  def test_most_revenue_by_quantity_returned
    assert_equal "768", item_repo.most_revenue(1).first.id
  end

  def test_most_revenue_sorted_by_quantity
    assert_equal "737", item_repo.most_revenue(2).first.id
  end

end
