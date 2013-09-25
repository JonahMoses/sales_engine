gem "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/merchant_repo"
require "csv"

class MerchantRepoTest < Minitest::Test

  attr_reader :merchant_repo
  
  def setup
    @merchant_repo = MerchantRepo.new("./data/merchants.csv")
  end

  def test_it_gets_filename
    assert_equal './data/merchants.csv', MerchantRepo.new.filename
  end

  def test_it_reads_file
    loaded_data   = CSV.read './data/merchants.csv', headers: true, header_converters: :symbol
    assert_equal loaded_data, merchant_repo.read_file
  end

  def test_it_loads_file_and_creates_merchants
    merchant_data = merchant_repo.merchant_data
    assert_equal 'Schroeder-Jerde', merchant_data.first[:name]
  end

  def test_find_by_merchants_by_name_and_get_id
    merchant = merchant_repo.find_by("merchant_name", "Williamson Group")
    assert_equal "5", merchant.merchant_id
  end

  def test_find_by_merchants_by_id_and_get_name
    merchant = merchant_repo.find_by("merchant_id", "5")
    assert_equal "Williamson Group", merchant.merchant_name
  end

  def test_find_all_by_merchants_by_id_and_get_name
    merchant = merchant_repo.find_all_by("merchant_id", "5")
    assert_equal 2, merchant.size
  end

  # def test_random_merchant
  #   merchant_repo = MerchantRepo.new
  #   random_one = merchant_repo.random
  #   random_two = merchant_repo.random
  #   assert_equal "1", random_two
  # end
  
end
