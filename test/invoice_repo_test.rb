require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/invoice_repo"
require "csv"

class InvoiceRepoTest < Minitest::Test

  attr_reader :invoice_repo
  
  def setup
    @invoice_repo = InvoiceRepo.new("./data/invoices.csv")
  end

  def test_it_gets_filename
    assert_equal './data/invoices.csv', InvoiceRepo.new.filename
  end

  def test_it_reads_file
    loaded_data   = CSV.read './data/invoices.csv', headers: true, header_converters: :symbol
    assert_equal loaded_data, invoice_repo.read_file
  end

  def test_it_loads_file_and_creates_invoices
    invoice_data = invoice_repo.invoice_data
    assert_equal '26', invoice_data.first[:merchant_id]
  end

  # def test_find_by_invoice_merchant_id_and_get_custmer_id
  #   invoice = @invoice_repo.find_by("merchant_id", "26")
  #   assert_equal "1", invoice.invoice_customer_id
  # end

  # def test_find_by_merchants_by_id_and_get_name
  #   merchant = merchant_repo.find_by("merchant_id", "5")
  #   assert_equal "Williamson Group", merchant.merchant_name
  # end

  # def test_find_all_by_merchants_by_id_and_get_name
  #   merchant = merchant_repo.find_all_by("merchant_id", "5")
  #   assert_equal 2, merchant.size
  # end
  
end
