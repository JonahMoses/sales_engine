require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/repos/customer_repo"
require "csv"

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

  # def test_define_method_find_by_id
  #   invoice = invoice_item_repo.find_by_id("1")
  #   assert_equal "1", invoice.id
  # end

  # def test_define_method_find_by_item_id
  #   invoice = invoice_item_repo.find_by_item_id("539")
  #   assert_equal "539", invoice.item_id
  # end

  # def test_define_method_find_by_invoice_id
  #   invoice = invoice_item_repo.find_by_invoice_id("1")
  #   assert_equal "1", invoice.invoice_id
  # end

  # def test_define_method_find_by_quantity
  #   invoice = invoice_item_repo.find_by_quantity("5")
  #   assert_equal "5", invoice.quantity
  # end

  # def test_define_method_find_by_unit_price
  #   invoice = invoice_item_repo.find_by_unit_price("13635")
  #   assert_equal "13635", invoice.unit_price
  # end

  # def test_define_method_find_by_created_at
  #   invoice = invoice_item_repo.find_by_created_at("2012-03-27 14:54:09 UTC")
  #   assert_equal "2012-03-27 14:54:09 UTC", invoice.created_at
  # end  

  # def test_define_method_find_by_updated_at
  #   invoice = invoice_item_repo.find_by_updated_at("2012-03-27 14:54:09 UTC")
  #   assert_equal "2012-03-27 14:54:09 UTC", invoice.updated_at
  # end  

  # def test_define_method_find_all_by_id
  #   invoice = invoice_item_repo.find_all_by_id("5")
  #   assert_equal 2, invoice.count
  # end
  
  # def test_define_method_find_all_by_item_id
  #   invoice = invoice_item_repo.find_all_by_item_id("529")
  #   assert_equal 2, invoice.count
  # end

  # def test_define_method_find_all_by_invoice_id
  #   invoice = invoice_item_repo.find_all_by_invoice_id("1")
  #   assert_equal 6, invoice.count
  # end

  # def test_define_method_find_all_by_quantity
  #   invoice = invoice_item_repo.find_all_by_quantity("7")
  #   assert_equal 2, invoice.count
  # end

  # def test_define_method_find_all_by_unit_price
  #   invoice = invoice_item_repo.find_all_by_unit_price("79140")
  #   assert_equal 2, invoice.count
  # end

  # def test_define_method_find_all_by_created_at
  #   invoice = invoice_item_repo.find_all_by_created_at("2012-03-27 14:54:09 UTC")
  #   assert_equal 6, invoice.count
  # end
  
  # def test_define_method_find_all_by_updated_at
  #   invoice = invoice_item_repo.find_all_by_updated_at("2012-03-27 14:54:09 UTC")
  #   assert_equal 6, invoice.count
  # end

  # def test_random_merchant
  #   invoice_item_one = @invoice_item_repo.random
  #   invoice_item_two = @invoice_item_repo.random
  #   100.times do
  #     break if invoice_item_one.id != invoice_item_two.id
  #     invoice_item_two = @invoice_item_repo.random
  #   end
  #   refute_equal invoice_item_one, invoice_item_two
  # end
  
end
