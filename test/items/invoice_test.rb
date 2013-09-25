require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/items/invoice"

class InvoiceTest < MiniTest::Test
  
  def invoice_attributes
    {id: "1", customer_id: "1", merchant_id: "26", status: "shipped", created_at: "2012-03-25 09:54:09 UTC", updated_at: "2012-03-25 09:54:09 UTC"}
  end

  def invoice
    @invoice ||= Invoice.new(invoice_attributes)
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
end
