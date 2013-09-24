gem "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/merchant_repo"
require "csv"

class MerchantRepoTest < Minitest::Test

  def test_loading_filename
    filename      = "./data/merchants.csv"
    merchant_repo = MerchantRepo.new(filename)
    merchant      = merchant_repo.merchant_list[0]
    assert_equal 5, merchant_repo.merchant_list.length
    assert_equal "Schroeder-Jerde", merchant[:name]
  end

  def test_find_merchant_id
    id            = "1"
    filename      = "./data/merchants.csv" 
    merchant_repo = MerchantRepo.new(filename)
    merchant_repo.find_merchant_id(id)
    merchant      = merchant_repo.search_results[0]
    assert_equal "1", merchant.merchant_id
  end

  def test_find_merchant_name
    name            = "Schroeder-Jerde"
    filename      = "./data/merchants.csv" 
    merchant_repo = MerchantRepo.new(filename)
    merchant_repo.find_merchant_name(name)
    merchant      = merchant_repo.search_results[0]
    assert_equal "Schroeder-Jerde", merchant.merchant_name
  end

  def test_find_merchant_created_at
    created_at            = "2012-03-27 14:53:59 UTC"
    filename      = "./data/merchants.csv" 
    merchant_repo = MerchantRepo.new(filename)
    merchant_repo.find_merchant_created_at(created_at)
    merchant      = merchant_repo.search_results[0]
    assert_equal "2012-03-27 14:53:59 UTC", merchant.merchant_created_at
  end

  def test_find_merchant_updated_at
    name            = "Schroeder-Jerde"
    filename      = "./data/merchants.csv" 
    merchant_repo = MerchantRepo.new(filename)
    merchant_repo.find_merchant_name(name)
    merchant      = merchant_repo.search_results[0]
    assert_equal "Schroeder-Jerde", merchant.merchant_name
  end
  
end
