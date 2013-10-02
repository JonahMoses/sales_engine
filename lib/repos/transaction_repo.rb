require 'csv'
require_relative '../items/transaction'

class TransactionRepo
  
  attr_reader :transaction_list,
              :filename,
              :transactions,
              :engine

  def initialize(filename = './data/transactions.csv', engine)
    @filename = filename
    @engine   = engine
  end

  %w[id invoice_id credit_card_number credit_card_expiration_date result created_at updated_at].each do |attribute|
    define_method("find_by_#{attribute}") do |value|
      all.find do |transaction|
        transaction.send(attribute).to_s.downcase == value.to_s.downcase
      end
    end
  end

  %w[id invoice_id credit_card_number credit_card_expiration_date result created_at updated_at].each do |attribute|
    define_method("find_all_by_#{attribute}") do |value|
      all.find_all do |transaction|
        transaction.send(attribute).to_s.downcase == value.to_s.downcase
      end
    end
  end

  def find_all_by_invoice_id(invoice_id)
    transactions_grouped_by_invoice_id[invoice_id] || []
  end

  def transactions_grouped_by_invoice_id
    @transactions_grouped_by_invoice_id ||= all.group_by { |transaction| transaction.invoice_id }
  end 

  def random
    transactions.sample
  end

  def transactions
    @transaction_list ||= build_transactions
  end

  def all
    transactions
  end

  private

  def read_file
    CSV.read filename, headers: true, header_converters: :symbol
  end

  def build_transactions
    transaction_list = []

    read_file.each do |row|
      transaction_list << Transaction.new(row, engine)
    end

    transaction_list
  end

end
