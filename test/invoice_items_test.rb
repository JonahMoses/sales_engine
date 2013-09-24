require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice_items'
require 'csv'

class InvoiceItemsTest < MiniTest::Test 

  def contents
    CSV.read "./data/invoice_items.csv", headers: true, header_converters: :symbol
  end

  def item_attributes
    contents.each do |row|
      invoice_item_id = row[:id]
      item_id         = row[:item_id]
      invoice_id      = row[:invoice_id]
      quantity        = row[:quantity]
      unit_price      = row[:unit_price]
      created_at      = row[:created_at]
      updated_at      = row[:updated_at]
    end
  end

  def invoice_items
    invoice_items ||= InvoiceItems.new(item_attributes)
  end

  def test_invoice_items_id
    assert_equal item_attributes[:id], invoice_items.invoice_item_id
  end

  def test_item_id
    assert_equal item_attributes[:item_id], invoice_items.item_id
  end

  def test_invoice_id
    assert_equal item_attributes[:invoice_id], invoice_items.invoice_id
  end

  def test_quantity
    assert_equal item_attributes[:quantity], invoice_items.quantity
  end

  def test_unit_price
    assert_equal item_attributes[:unit_price], invoice_items.unit_price
  end

  def test_created_at
    assert_equal item_attributes[:created_at], invoice_items.created_at
  end

  def test_updated_at
    assert_equal item_attributes[:updated_at], invoice_items.updated_at
  end

end
