require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/repos/customer_repo"
require "csv"
require 'pry'

class CustomerRepoTest < Minitest::Test

  attr_reader :customer_repo
  
  def setup
    @customer_repo = CustomerRepo.new("./data/customers.csv")
  end

  def test_it_gets_filename
    assert_equal './data/customers.csv', CustomerRepo.new.filename
  end

  def test_it_loads_file_and_creates_customers
    customer_items = customer_repo.customer_items
    assert_equal '1', customer_items.first.id
  end

  def test_define_method_find_by_id
    customer = customer_repo.find_by_id("1")
    assert_equal "1", customer.id
  end

  def test_define_method_find_by_first_name
    customer = customer_repo.find_by_first_name("Joey")
    assert_equal "Joey", customer.first_name
  end

  def test_define_method_find_by_last_name
    customer = customer_repo.find_by_last_name("Ondricka")
    assert_equal "Ondricka", customer.last_name
  end

  def test_define_method_find_by_created_at
    customer = customer_repo.find_by_created_at("2012-03-27 14:54:09 UTC")
    assert_equal "2012-03-27 14:54:09 UTC", customer.created_at
  end  

  def test_define_method_find_by_updated_at
    customer = customer_repo.find_by_updated_at("2012-03-27 14:54:09 UTC")
    assert_equal "2012-03-27 14:54:09 UTC", customer.updated_at
  end  

  def test_define_method_find_all_by_id
    customer = customer_repo.find_all_by_id("5")
    assert_equal 2, customer.count
  end
  
  def test_define_method_find_all_by_first_name
    customer = customer_repo.find_all_by_first_name("Sylvester")
    assert_equal 2, customer.count
  end

  def test_define_method_find_all_by_last_name
    customer = customer_repo.find_all_by_last_name("Nader")
    assert_equal 2, customer.count
  end

  def test_define_method_find_all_by_created_at
    customer = customer_repo.find_all_by_created_at("2012-03-27 14:54:10 UTC")
    assert_equal 5, customer.count
  end
  
  def test_define_method_find_all_by_updated_at
    customer = customer_repo.find_all_by_updated_at("2012-03-27 14:54:10 UTC")
    assert_equal 5, customer.count
  end

  def test_random_merchant
    customer_one = @customer_repo.random
    customer_two = @customer_repo.random
    100.times do
      break if customer_one.id != customer_two.id
      customer_two = @customer_repo.random
    end
    refute_equal customer_one, customer_two
  end
  
end
