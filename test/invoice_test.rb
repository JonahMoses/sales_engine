require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/invoice"
require "csv"

class InvoiceTest < MiniTest::Test
  
  def contents
    contents = CSV.read "./data/invoices.csv", headers: true, header_converters: :symbol
  end

  def invoice_attributes
    contents.each do |attribute|
      id          = attribute[:id]       
      customer_id = attribute[:customer_id]       
      merchant_id = attribute[:merchant_id]
      status      = attribute[:status]
      created_at  = attribute[:created_at] 
      updated_at  = attribute[:updated_at] 
    end
  end

  def invoice
    #what does pipes mean??
    @invoice ||= Invoice.new(invoice_attributes)
  end

  def test_it_gets_item_id
    assert_equal invoice_attributes[:id], invoice.invoice_id
  end

  def test_it_gets_customer_id
    assert_equal invoice_attributes[:customer_id], invoice.invoice_customer_id
  end

  def test_it_gets_unit_price
    assert_equal invoice_attributes[:status], invoice.invoice_status
  end

  def test_it_gets_merchant_id
    assert_equal invoice_attributes[:merchant_id], invoice.invoice_merchant_id
  end

  def test_it_gets_created_at
    assert_equal invoice_attributes[:created_at], invoice.invoice_created_at
  end
  def test_it_gets_updated_at
    assert_equal invoice_attributes[:updated_at], invoice.invoice_updated_at
  end
end
