require "minitest"
require "minitest/autorun"
require "minitest/pride"
require 'pry'
require "csv"
require_relative "../lib/items/customer"
require_relative "../lib/items/invoice"
require_relative "../lib/items/invoice_items"
require_relative "../lib/items/item"
require_relative "../lib/items/merchant"
require_relative "../lib/items/transaction"
require_relative "../lib/repos/customer_repo"
require_relative "../lib/repos/invoice_item_repo"
require_relative "../lib/repos/invoice_repo"
require_relative "../lib/repos/item_repo"
require_relative "../lib/repos/merchant_repo"
require_relative "../lib/repos/transaction_repo"
require_relative "../lib/sales_engine"

class SalesEngineTest < Minitest::Test

  attr_reader :sales_engine
  
  def setup
    @sales_engine = SalesEngine.new
    @sales_engine.startup
  end

  def test_it_loads_customer_repository
    assert_kind_of CustomerRepo, @sales_engine.customer_repository
  end 

  def test_it_loads_invoice_item_repository
    invoice_item_repository = InvoiceItemRepo.new
    assert_kind_of invoice_item_repository.class, sales_engine.invoice_item_repository
  end 

  def test_it_loads_invoice_repository
    invoice_repository = InvoiceRepo.new
    assert_kind_of invoice_repository.class, sales_engine.invoice_repository
  end 

  def test_it_loads_item_repository
    item_repository = ItemRepo.new
    assert_kind_of item_repository.class, sales_engine.item_repository
  end 

  def test_it_loads_merchant_repository
    merchant_repository = MerchantRepo.new
    assert_kind_of merchant_repository.class, sales_engine.merchant_repository
  end 

  def test_it_loads_transaction_repository
    transaction_repository = TransactionRepo.new
    assert_kind_of transaction_repository.class, sales_engine.transaction_repository
  end 

end
