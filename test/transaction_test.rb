require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/transaction'
require 'csv'

class TransactionTest < MiniTest::Test  

  def contents
    CSV.read "./data/transactions.csv", headers: true, header_converters: :symbol
  end 

  def transaction_attributes
    contents.each do |row|
      id                          = row[:id],
      invoice_id                  = row[:invoice_id],
      credit_card_number          = row[:credit_card_number],
      credit_card_expiration_date = row[:credit_card_expiration_date],
      result                      = row[:result],
      created_at                  = row[:created_at],
      updated_at                  = row[:updated_at]
    end
  end

  def transaction
    transaction ||= Transaction.new(transaction_attributes)
  end

  def test_transaction_id
    assert_equal transaction_attributes[:id], transaction.transaction_id
  end

  def test_invoice_id
    assert_equal transaction_attributes[:invoice_id], transaction.invoice_id
  end

  def test_credit_card_number
    assert_equal transaction_attributes[:credit_card_number], transaction.credit_card_number
  end

  def test_credit_card_expiration_date
    assert_equal transaction_attributes[:credit_card_expiration_date], transaction.credit_card_expiration_date
  end

  def test_result
    assert_equal transaction_attributes[:result], transaction.result
  end

  def test_created_at
    assert_equal transaction_attributes[:created_at], transaction.created_at
  end

  def test_updated_at
    assert_equal transaction_attributes[:updated_at], transaction.updated_at
  end



end  

