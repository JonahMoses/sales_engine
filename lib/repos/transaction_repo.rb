require 'csv'
require_relative '../items/transaction'

class TransactionRepo
  
  attr_reader :transaction_list,
              :filename,
              :transactions,
              :engine

  def initialize(filename = './data/transactions.csv')
    @filename = filename
    # @engine = engine
  end

  %w[id invoice_id credit_card_number credit_card_expiration_date result created_at updated_at].each do |attribute|
    define_method("find_by_#{attribute}") do |value|
      transaction_objects.find do |transaction|
        transaction.send(attribute).to_s.downcase == value.downcase
      end
    end
  end

  %w[id invoice_id credit_card_number credit_card_expiration_date result created_at updated_at].each do |attribute|
    define_method("find_all_by_#{attribute}") do |value|
      transaction_objects.find_all do |transaction|
        transaction.send(attribute).to_s.downcase == value.downcase
      end
    end
  end

  def random
    transaction_objects.sample
  end

  def transactions
    transaction_objects
  end

  private

  def read_file
    @transactions = CSV.read "./data/transactions.csv", headers: true, header_converters: :symbol
  end

  def transaction_objects
    @transaction_list = []
    read_file.each do |row|
      @transaction_list << Transaction.new(row)
    end
    return @transaction_list
  end

end
