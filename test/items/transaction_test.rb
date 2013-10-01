require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/items/transaction'
require './lib/items/invoice'
require './lib/repos/invoice_repo'

class TransactionTest < MiniTest::Test  

  attr_reader :transaction_repo,
              :engine
  
  def setup
    @engine = SalesEngine.new
    @transaction_repo = engine.transaction_repository
  end

  def transaction
    @transaction ||= @transaction_repo.transactions.first
  end

  def test_transaction_id
    assert_equal "1", transaction.id
  end

  def test_invoice_id
    assert_equal "1", transaction.invoice_id
  end

  def test_credit_card_number
    assert_equal "4654405418249632", transaction.credit_card_number
  end

  def test_credit_card_expiration_date
    assert_equal "", transaction.credit_card_expiration_date
  end

  def test_result
    assert_equal "success", transaction.result
  end

  def test_created_at
    assert_equal "2012-03-27 14:54:09 UTC", transaction.created_at
  end

  def test_updated_at
    assert_equal "2012-03-27 14:54:09 UTC", transaction.updated_at
  end

  def test_each_transaction_returns_an_invoice
    assert_kind_of Invoice, transaction.invoice
  end

end  

