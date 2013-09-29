require 'csv'
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
              :transaction_repository

  def startup
    @customer_repository ||= CustomerRepo.new('./data/customers.csv')
    @invoice_item_repository ||= InvoiceItemRepo.new('./data/invoice_items.csv')
    @invoice_repository ||= InvoiceRepo.new('./data/invoices.csv')
    @item_repository ||= ItemRepo.new('./data/items.csv')
    @merchant_repository ||= MerchantRepo.new('./data/merchants.csv')
    @transaction_repository ||= TransactionRepo.new('./data/transactions.csv')
  end

end

