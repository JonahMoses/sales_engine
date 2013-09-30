require "minitest"
require "minitest/autorun"
require "minitest/pride"
# require "./lib/items/invoice"
require "./lib/sales_engine"
require 'pry'

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
    invoice.transactions.each do |transaction|
      assert_kind_of Transaction, transaction
    end
  end

  def test_it_returns_collection_of_invoice_items_instances
    assert_kind_of Array, invoice.invoice_items
    assert_equal invoice.invoice_items.size, 6
  end

  def test_each_invoice_item_in_the_invoice_items_array_is_an_invoice_item
    invoice.invoice_items.each do |invoice_item|
      assert_kind_of InvoiceItems, invoice_item
    end
  end

  def test_it_returns_collection_of_item_instances_by_way_of_invoice_item_objects
    assert_kind_of Array, invoice.items
  end

  def test_each_item_is_an_item
    invoice.items.each do |item|
      assert_kind_of Item, item
    end
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

end
