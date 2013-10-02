require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/items/customer.rb'
require "./lib/sales_engine"

class CustomerTest < MiniTest::Test 

  attr_reader :customer_repo,
              :engine
  
  def setup
    @engine = SalesEngine.new
    @customer_repo = engine.customer_repository
  end

  def customer
    @customer ||= @customer_repo.customers.first
  end

  def test_customer_id
    assert_equal "1", customer.id
  end
  
  def test_customer_first_name
    assert_equal "Joey", customer.first_name
  end
  
  def test_customer_last_name
    assert_equal "Ondricka", customer.last_name
  end
  
  def test_created_at
    assert_equal "2012-03-27 14:54:09 UTC", customer.created_at
  end
  
  def test_updated_at
    assert_equal "2012-03-27 14:54:09 UTC", customer.updated_at
  end

  def test_each_customer_returns_invoices
    assert_kind_of Array, customer.invoices
  end

  def test_each_customer_in_the_array_is_a_customer
    customer.invoices.each do |customer|
      assert_kind_of Invoice, customer
    end
  end
end
