require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/repos/invoice_repo"
require "csv"

class InvoiceRepoTest < Minitest::Test

  attr_reader :invoice_repo
  
  def setup
    @invoice_repo = InvoiceRepo.new("./data/invoices.csv")
  end

  def test_it_gets_filename
    assert_equal './data/invoices.csv', InvoiceRepo.new.filename
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
    assert_equal "1", invoice.customer_id
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

  def test_define_method_find_all_by_created_at
    invoice = invoice_repo.find_all_by_created_at("2012-03-07 19:54:10 UTC")
    assert_equal 2, invoice.count
  end
  
  def test_define_method_find_all_by_created_at
    invoice = invoice_repo.find_all_by_created_at("2012-03-07 19:54:10 UTC")
    assert_equal 2, invoice.count
  end

  # def test_define_method_find_all_by_updated_at
  #   invoice = invoice_repo.find_all_by_updated_at("2012-03-07 19:54:10 UTC")
  #   assert_equal 2, invoice.count
  # end

  def test_random_merchant
    invoice_one = @invoice_repo.random
    invoice_two = @invoice_repo.random
    100.times do
      break if invoice_one.id != invoice_two.id
      invoice_two = @invoice_repo.random
    end
    refute_equal invoice_one, invoice_two
  end
  
end
