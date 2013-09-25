require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/items/invoice_items'

class InvoiceItemsTest < MiniTest::Test 

  def invoice_item_attributes
      {id: "1", item_id: "529", invoice_id: "1", quantity: "5", unit_price: "13635", created_at: "2012-03-27 14:54:09 UTC", updated_at: "2012-03-27 14:54:09 UTC"}
  end

  def invoice_items
    invoice_items ||= InvoiceItems.new(invoice_item_attributes)
  end

  def test_invoice_items_id
    assert_equal "1", invoice_items.id
  end

  def test_item_id
    assert_equal "529", invoice_items.item_id
  end

  def test_invoice_id
    assert_equal "1", invoice_items.invoice_id
  end

  def test_quantity
    assert_equal "5", invoice_items.quantity
  end

  def test_unit_price
    assert_equal "13635", invoice_items.unit_price
  end

  def test_created_at
    assert_equal "2012-03-27 14:54:09 UTC", invoice_items.created_at
  end

  def test_updated_at
    assert_equal "2012-03-27 14:54:09 UTC", invoice_items.updated_at
  end

end
