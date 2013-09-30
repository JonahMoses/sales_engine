require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/sales_engine"
require "./lib/repos/transaction_repo"
require "csv"

class TransactionRepoTest < Minitest::Test

  attr_reader :transaction_repo,
              :engine
  
  def setup
    @engine = SalesEngine.new
    @transaction_repo = engine.transaction_repository
  end

  def test_it_gets_filename
    assert_equal './data/transactions.csv', transaction_repo.filename
  end

  def test_it_loads_file_and_creates_merchants
    transactions = transaction_repo.transactions
    assert_equal '1', transactions.first.id
  end

  def test_define_method_find_by_id
    transaction = transaction_repo.find_by_id("1")
    assert_equal "1", transaction.id
  end

  def test_define_method_find_by_invoice_id
    transaction = transaction_repo.find_by_invoice_id("1")
    assert_equal "1", transaction.invoice_id
  end

  def test_define_method_find_by_credit_card_number
    transaction = transaction_repo.find_by_credit_card_number("4.65441E+15")
    assert_equal "4.65441E+15", transaction.credit_card_number
  end

  def test_define_method_find_by_credit_card_expiration_date
    transaction = transaction_repo.find_by_credit_card_expiration_date("")
    assert_equal "", transaction.credit_card_expiration_date
  end

  def test_define_method_find_by_result
    transaction = transaction_repo.find_by_result("success")
    assert_equal "success", transaction.result
  end

  def test_define_method_find_by_created_at
    transaction = transaction_repo.find_by_created_at("2012-03-27 14:54:09 UTC")
    assert_equal "2012-03-27 14:54:09 UTC", transaction.created_at
  end

  def test_define_method_find_by_updated_at
    transaction = transaction_repo.find_by_updated_at("2012-03-27 14:54:09 UTC")
    assert_equal "2012-03-27 14:54:09 UTC", transaction.updated_at
  end

  def test_define_method_find_all_by_id
    transaction = transaction_repo.find_all_by_id("5")
    assert_equal 2, transaction.count
  end

  def test_define_method_find_all_by_invoice_id
    transaction = transaction_repo.find_all_by_invoice_id("1")
    assert_equal 1, transaction.count
  end

  def test_define_method_find_all_by_credit_card_number
    transaction = transaction_repo.find_all_by_credit_card_number("4.65441E+15")
    assert_equal 1, transaction.count
  end

  def test_define_method_find_all_by_credit_card_expiration_date
    transaction = transaction_repo.find_all_by_credit_card_expiration_date("")
    assert_equal 6, transaction.count
  end

  def test_define_method_find_all_by_result
    transaction = transaction_repo.find_all_by_result("success")
    assert_equal 6, transaction.count
  end

  def test_define_method_find_all_by_created_at
    transaction = transaction_repo.find_all_by_created_at("2012-03-27 14:54:09 UTC")
    assert_equal 2, transaction.count
  end

  def test_define_method_find_all_by_updated_at
    transaction = transaction_repo.find_all_by_updated_at("2012-03-27 14:54:10 UTC")
    assert_equal 4, transaction.count
  end

  def test_random_merchant
    merchant_one = @transaction_repo.random
    merchant_two = @transaction_repo.random
    100.times do
      break if merchant_one.id != merchant_two.id
      merchant_two = @transaction_repo.random
    end
    refute_equal merchant_one, merchant_two
  end

end
