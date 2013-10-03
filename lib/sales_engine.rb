require 'csv'
require 'bigdecimal'
require_relative '../lib/items/customer'
require_relative '../lib/repos/customer_repo'
require_relative '../lib/items/invoice_items'
require_relative '../lib/repos/invoice_item_repo'
require_relative '../lib/items/invoice'
require_relative '../lib/repos/invoice_repo'
require_relative '../lib/items/item'
require_relative '../lib/repos/item_repo'
require_relative '../lib/items/merchant'
require_relative '../lib/repos/merchant_repo'
require_relative '../lib/items/transaction'
require_relative '../lib/repos/transaction_repo'

class SalesEngine

  attr_reader :customer_repository,
              :invoice_item_repository,
              :invoice_repository,
              :item_repository,
              :merchant_repository,
              :transaction_repository,
              :data_directory

  def initialize(data_directory = './data')
    @data_directory = data_directory
    startup
  end

  def startup
    @customer_repository ||= CustomerRepo.new(file('customers'), self)
    @invoice_item_repository ||= InvoiceItemRepo.new(file('invoice_items'), self)
    @invoice_repository ||= InvoiceRepo.new(file('invoices'), self)
    @item_repository ||= ItemRepo.new(file('items'), self)
    @merchant_repository ||= MerchantRepo.new(file('merchants'), self)
    @transaction_repository ||= TransactionRepo.new(file('transactions'), self)
  end

  private

  def file(name)
    File.join(data_directory, "#{name}.csv")
  end


end

