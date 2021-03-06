require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/sales_engine"
require "./lib/repos/invoice_repo"
require "csv"

class InvoiceRepoTest < Minitest::Test

  attr_reader :invoice_repo,
              :engine
  
  def setup
    @engine = SalesEngine.new
    @invoice_repo = engine.invoice_repository
  end

  def test_it_gets_filename
    assert_equal './data/invoices.csv', @invoice_repo.filename
  end

  def test_it_loads_file_and_creates_invoices
    invoices = invoice_repo.invoices
    assert_equal '1', invoices.first.id
  end

  def test_define_method_find_by_id
    invoice = invoice_repo.find_by_id("1")
    assert_equal "1", invoice.id
  end

  def test_define_method_find_by_customer_id
    invoice = invoice_repo.find_by_customer_id("1")
    assert_equal 1, invoice.customer_id
  end

  def test_define_method_find_by_merchant_id
    invoice = invoice_repo.find_by_merchant_id("26")
    assert_equal "26", invoice.merchant_id
  end

  def test_define_method_find_by_status
    invoice = invoice_repo.find_by_status("shipped")
    assert_equal "shipped", invoice.status
  end

  def test_define_method_find_by_created_at
    invoice = invoice_repo.find_by_created_at("2012-03-25 09:54:09 UTC")
    assert_equal "2012-03-25 09:54:09 UTC", invoice.created_at
  end

  def test_define_method_find_by_updated_at
    invoice = invoice_repo.find_by_updated_at("2012-03-25 09:54:09 UTC")
    assert_equal "2012-03-25 09:54:09 UTC", invoice.updated_at
  end  

  def test_define_method_find_all_by_id
    invoice = invoice_repo.find_all_by_id("1")
    assert_equal 1, invoice.count
  end
  
  def test_define_method_find_all_by_customer_id
    invoice = invoice_repo.find_all_by_customer_id("1")
    assert_equal 8, invoice.count
  end

  def test_define_method_find_all_by_merchant_id
    invoice = invoice_repo.find_all_by_merchant_id("41")
    assert_equal 54, invoice.count
  end

  def test_define_method_find_all_by_status
    invoice = invoice_repo.find_all_by_status("shipped")
    assert_equal 4843, invoice.count
  end

  def test_define_method_find_all_by_created_at
    invoice = invoice_repo.find_all_by_created_at("2012-03-07 19:54:10 UTC")
    assert_equal 1, invoice.count
  end

  def test_define_method_find_all_by_updated_at
    invoice = invoice_repo.find_all_by_updated_at("2012-03-07 19:54:10 UTC")
    assert_equal 1, invoice.count
  end
  
  def test_random_merchant
    invoice_one = @invoice_repo.random
    invoice_two = @invoice_repo.random
    100.times do
      break if invoice_one.id != invoice_two.id
      invoice_two = @invoice_repo.random
    end
    refute_equal invoice_one, invoice_two
  end

  def test_all_things_in_repository
    invoices = invoice_repo.all
    assert_equal 4843, invoices.count
  end
  
  
end
