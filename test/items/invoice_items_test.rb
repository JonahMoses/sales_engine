require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/items/invoice_items'
require 'pry'

class InvoiceItemsTest < MiniTest::Test 

  attr_reader :invoice_items_repo,
              :engine
  
  def setup
    @engine = SalesEngine.new
    @invoice_items_repo = engine.invoice_item_repository
  end

  def invoice_item
    invoice_item ||= invoice_items_repo.invoice_items.first
  end

  def test_invoice_items_id
    assert_equal "1", invoice_item.id
  end

  def test_item_id
    assert_equal "1", invoice_item.item_id
  end

  def test_invoice_id
    assert_equal "1", invoice_item.invoice_id
  end

  def test_quantity
    assert_equal "5", invoice_item.quantity
  end

  def test_unit_price
    assert_equal "13635", invoice_item.unit_price
  end

  def test_created_at
    assert_equal "2012-03-27 14:54:09 UTC", invoice_item.created_at
  end

  def test_updated_at
    assert_equal "2012-03-27 14:54:09 UTC", invoice_item.updated_at
  end

  def test_each_invoice_item_returns_an_invoice
    assert_kind_of Invoice, invoice_item.invoice
  end

  def test_each_item_returns_an_item
    assert_kind_of Item, invoice_item.item
  end

end
