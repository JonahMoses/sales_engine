require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/sales_engine"

class InvoiceTest < MiniTest::Test
  
  attr_reader :invoice_repo,
              :engine
  
  def setup
    @engine = SalesEngine.new
    @invoice_repo = engine.invoice_repository
  end

  def invoice
    @invoice ||= @invoice_repo.invoices.first
  end

  def test_it_gets_invoice_id
    assert_equal "1", invoice.id
  end

  def test_it_gets_customer_id
    assert_equal "1", invoice.customer_id
  end

  def test_it_gets_merchant_id
    assert_equal "26", invoice.merchant_id
  end

  def test_it_gets_invoice_status
    assert_equal "shipped", invoice.status
  end

  def test_it_gets_created_at
    assert_equal "2012-03-25 09:54:09 UTC", invoice.created_at
  end

  def test_it_gets_updated_at
    assert_equal "2012-03-25 09:54:09 UTC", invoice.updated_at
  end

  def test_it_returns_collection_of_transaction_instances
    assert_kind_of Array, invoice.transactions
  end

  def test_each_transaction_in_the_transactions_array_is_an_transaction
    assert_kind_of Transaction, invoice.transactions.first
  end

  def test_it_returns_collection_of_invoice_items_instances
    assert_kind_of Array, invoice.invoice_items
    assert_equal 8, invoice.invoice_items.size
  end

  def test_each_invoice_item_in_the_invoice_items_array_is_an_invoice_item
    assert_kind_of InvoiceItems, invoice.invoice_items.first
  end

  def test_it_returns_collection_of_item_instances_by_way_of_invoice_item_objects
    assert_kind_of Array, invoice.items
  end

  def test_each_item_is_an_item
    assert_kind_of Item, invoice.items.first
  end

  def test_it_returns_a_customer_instances
    assert_kind_of Customer, invoice.customer
  end

  def test_it_returns_a_merchant_instances
    assert_kind_of Merchant, invoice.merchant
  end

  def test_each_item_should_equal_something
    assert invoice.items.size > 0, true
  end

  def test_it_gets_total_prices
    assert_equal 2106777, invoice.total_prices
  end

  def test_it_is_successful?
    assert_equal true, invoice.successful?
  end

  # def test_it_gets_total_items
  #   assert_equal 1, invoice.total_items
  # end
end
