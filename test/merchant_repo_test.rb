gem "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/merchant_repo"
require "csv"

class MerchantRepoTest < Minitest::Test

  def test_loading_filename
    filename = "./data/merchants.csv"
    assert_equal "./data/merchants.csv", MerchantRepo.new.load(filename)
  end

  def test_find_id
    id = "1"
    assert_equal 1, MerchantRepo.new.find_id(id)
  end

end
