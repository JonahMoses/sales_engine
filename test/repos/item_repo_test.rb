require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/repos/item_repo"
require "csv"

class InvoiceRepoTest < Minitest::Test

  attr_reader :item_repo
  
  def setup
    @item_repo = ItemRepo.new("./data/items.csv")
  end

  def test_it_gets_filename
    assert_equal './data/items.csv', ItemRepo.new.filename
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
    item = item_repo.find_by_unit_price("75107")
    assert_equal "75107", item.unit_price
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
  
  # def test_define_method_find_all_by_created_at
  #   item = item_repo.find_all_by_created_at("2012-03-07 19:54:10 UTC")
  #   assert_equal 2, item.count
  # end

  # def test_define_method_find_all_by_updated_at
  #   item = item_repo.find_all_by_updated_at("2012-03-07 19:54:10 UTC")
  #   assert_equal 2, item.count
  # end

  # def test_random_merchant
  #   item_one = @item_repo.random
  #   item_two = @item_repo.random
  #   100.times do
  #     break if item_one.id != item_two.id
  #     item_two = @item_repo.random
  #   end
  #   refute_equal item_one, item_two
  # end
  
end
