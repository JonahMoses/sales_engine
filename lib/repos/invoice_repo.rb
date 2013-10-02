require 'csv'
require_relative '../items/invoice.rb'

class InvoiceRepo
  
  attr_reader :invoice_list,
              :filename,
              :invoices,
              :engine

  def initialize(filename = './data/invoices.csv', engine)
    @filename = filename
    @engine   = engine
  end

  %w[id customer_id merchant_id status created_at updated_at].each do |attribute|
    define_method("find_by_#{attribute}") do |value|
      all.find do |invoice|
        invoice.send(attribute).to_s.downcase == value.to_s.downcase
      end
    end
  end

  %w[id customer_id merchant_id status created_at updated_at].each do |attribute|
    define_method("find_all_by_#{attribute}") do |value|
      all.find_all do |invoice|
        invoice.send(attribute).to_s.downcase == value.to_s.downcase
      end
    end
  end

  def find_all_by_merchant_id(merchant_id)
    invoices_grouped_by_merchant[merchant_id] || []
  end

  def invoices_grouped_by_merchant
    @invoices_grouped_by_merchant ||= all.group_by { |invoice| invoice.merchant_id }
  end

  def random
    invoices.sample
  end

  def invoices
    @invoice_list ||= build_invoices
  end

  def all
    invoices
  end

  private

  def read_file
    CSV.read filename, headers: true, header_converters: :symbol
  end

  def build_invoices
    invoice_list = []

    read_file.each do |row|
      invoice_list << Invoice.new(row, engine)
    end

    invoice_list
  end

end
