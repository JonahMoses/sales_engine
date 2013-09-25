require 'csv'
require 'pry'
require './lib/invoice.rb'

class InvoiceRepo
  attr_reader :invoice_list,
              :filename,
              :invoice_data

  def initialize(filename = './data/invoices.csv')
    @filename = filename
    invoice_objects
  end

  def read_file
    @invoice_data = CSV.read "./data/invoices.csv", headers: true, header_converters: :symbol
  end

  def invoice_objects
    @invoice_list = []
    read_file.each do |row|
      @invoice_list << Invoice.new(row)
    end
    return @invoice_list
  end

  def find_by(attribute, value)
  #   merchant_objects.find do |merchant|
  #     merchant.send(attribute).downcase == value.downcase
  #   end
  end

  # def find_all_by(attribute, value)
  #   results = []
  #   merchant_objects.select do |merchant|
  #     if merchant.send(attribute).downcase == value.downcase
  #     results << merchant
  #     end
  #   end
  # end

end
