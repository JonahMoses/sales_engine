require 'csv'
require './lib/items/invoice.rb'

class InvoiceRepo
  attr_reader :invoice_list,
              :filename,
              :invoices,
              :sales_engine

  def initialize(filename = './data/invoices.csv')
    @filename = filename
    @sales_engine = sales_engine
  end

  %w[id customer_id merchant_id status created_at updated_at].each do |attribute|
    define_method("find_by_#{attribute}") do |value|
      invoice_objects.find do |invoice|
        invoice.send(attribute).to_s.downcase == value.downcase
      end
    end
  end

  %w[id customer_id merchant_id status created_at updated_at].each do |attribute|
    define_method("find_all_by_#{attribute}") do |value|
      invoice_objects.find_all do |invoice|
        invoice.send(attribute).to_s.downcase == value.downcase
      end
    end
  end

  def random
    invoice_objects.sample
  end

  def invoices
    invoice_objects
  end

  private

  def read_file
    @invoices = CSV.read "./data/invoices.csv", headers: true, header_converters: :symbol
  end

  def invoice_objects
    @invoice_list = []
    read_file.each do |row|
      @invoice_list << Invoice.new(row)
    end
    return @invoice_list
  end

end
