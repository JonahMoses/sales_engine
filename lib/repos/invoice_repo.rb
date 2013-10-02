require 'csv'
require_relative '../items/invoice.rb'

class InvoiceRepo
  
  attr_reader :invoice_list,
              :filename,
              :invoices,
              :engine

  def initialize(filename = './data/invoices.csv', engine)
    @filename = filename
    @engine = engine
  end

  %w[id customer_id merchant_id status created_at updated_at].each do |attribute|
    define_method("find_by_#{attribute}") do |value|
      invoice_objects.find do |invoice|
        invoice.send(attribute).to_s.downcase == value.to_s.downcase
      end
    end
  end

  %w[id customer_id merchant_id status created_at updated_at].each do |attribute|
    define_method("find_all_by_#{attribute}") do |value|
      invoice_objects.find_all do |invoice|
        invoice.send(attribute).to_s.downcase == value.to_s.downcase
      end
    end
  end

  def random
    invoice_objects.sample
  end

  def invoices
    invoice_list ||= invoice_objects
  end

  def all
    invoices
  end

  private

  def read_file
    @invoices = CSV.read filename, headers: true, header_converters: :symbol
  end

  def invoice_objects
    @invoice_list = []
    read_file.each do |row|
      @invoice_list << Invoice.new(row, engine)
    end
    return @invoice_list
  end

end
