require 'csv'
require './lib/merchant.rb'

class MerchantRepo
  attr_reader :merchant_list,
              :filename,
              :search_results,
              :merchant_data

  def initialize(filename = './data/merchants.csv')
    @merchant_list  = []
    @filename       = filename
    @merchant_data  = []
    @search_results = []
    read_file
    merchant_objects
  end

  def read_file
    @merchant_data = CSV.read "./data/merchants.csv", headers: true, header_converters: :symbol
  end

  def merchant_objects
    read_file.each do |row|
      @merchant_list << Merchant.new(row)
    end
    return @merchant_list
  end

  def find_by(attribute, value)
    merchant_objects.find do |merchant|
      merchant.send(attribute) == value
    end
  end

  def find_all_by(attribute, value)
    merchant_objects.select do |merchant|
      merchant.send(attribute) == value
    end
  end

end
