require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/sales_engine"
require "./lib/repos/merchant_repo"
require "csv"

class MerchantRepoTest < Minitest::Test

  attr_reader :merchant_repo,
              :engine
  
  def setup
    @engine = SalesEngine.new
    @merchant_repo = engine.merchant_repository
  end

  def test_it_gets_filename
    assert_equal './data/merchants.csv', merchant_repo.filename
  end

  def test_it_loads_file_and_creates_merchants
    merchants = merchant_repo.merchants
    assert_equal 'Schroeder-Jerde', merchants.first.name
  end

  def test_define_method_find_by_id
    merchant = merchant_repo.find_by_id("1")
    assert_equal "1", merchant.id
  end

  def test_define_method_find_by_name
    merchant = merchant_repo.find_by_name("Williamson Group")
    assert_equal "Williamson Group", merchant.name
  end

  def test_define_method_find_by_created_at
    merchant = merchant_repo.find_by_created_at("2012-03-27 14:53:59 UTC")
    assert_equal "2012-03-27 14:53:59 UTC", merchant.created_at
  end

  def test_define_method_find_by_updated_at
    merchant = merchant_repo.find_by_updated_at("2012-03-27 14:53:59 UTC")
    assert_equal "2012-03-27 14:53:59 UTC", merchant.updated_at
  end

  def test_define_method_find_all_by_name
    merchant = merchant_repo.find_all_by_name("Williamson Group")
    assert_equal 2, merchant.count
  end

  def test_random_merchant
    merchant_one = @merchant_repo.random
    merchant_two = @merchant_repo.random
    100.times do
      break if merchant_one.id != merchant_two.id
      merchant_two = @merchant_repo.random
    end
    refute_equal merchant_one, merchant_two
  end
  
  def test_all_things_in_repository
    merchants = merchant_repo.all
    assert_equal 100, merchants.count
  end

  def test_most_revenue_sorted_by_quantity
    assert_equal "26", merchant_repo.most_revenue(7).first.id
  end

  def test_most_items_by_number_of_items_sold
    assert_equal 3, merchant_repo.most_items(3).count
    # merchant_repo.most_items(10).each do |merchant|
    #   puts merchant.items.count
    # end
  end

end
