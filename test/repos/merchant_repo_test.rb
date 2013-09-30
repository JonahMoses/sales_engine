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
  
end
