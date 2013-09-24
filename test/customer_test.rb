require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/customer.rb'
require 'csv'

class CustomerTest < MiniTest::Test 

  def contents
    contents = CSV.read './data/customers.csv', headers: true, header_converters: :symbol
  end
  
  def customer_attributes
    contents.each do |row|
      customer_id = row[:id]
      first_name  = row[:first_name]
      last_name   = row[:last_name]
      created_at  = row[:created_at]
      updated_at  = row[:updated_at]
    end
  end

  def customer
    @customer = Customer.new(customer_attributes)
  end
  def test_customer_id
    assert_equal customer_attributes[:id], customer.customer_id
  end
  def test_customer_first_name
    assert_equal customer_attributes[:first_name], customer.first_name
  end
  def test_customer_last_name
    assert_equal customer_attributes[:last_name], customer.last_name
  end
  def test_created_at
    assert_equal customer_attributes[:created_at], customer.created_at
  end
  def test_updated_at
    assert_equal customer_attributes[:created_at], customer.updated_at
  end
end
