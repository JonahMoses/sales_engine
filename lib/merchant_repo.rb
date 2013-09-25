require 'csv'
require 'pry'
require './lib/merchant.rb'

class MerchantRepo
  attr_reader :merchant_list,
              :filename,
              :merchant_data

  def initialize(filename = './data/merchants.csv')
    @filename = filename
    merchant_objects
  end

  def read_file
    @merchant_data = CSV.read "./data/merchants.csv", headers: true, header_converters: :symbol
  end

  def merchant_objects
    @merchant_list = []
    read_file.each do |row|
      @merchant_list << Merchant.new(row)
    end
    return @merchant_list
  end

  def find_by(attribute, value)
    merchant_objects.find do |merchant|
      merchant.send(attribute).downcase == value.downcase
    end
  end

  def find_all_by(attribute, value)
    results = []
    merchant_objects.select do |merchant|
      if merchant.send(attribute).downcase == value.downcase
      results << merchant
      end
    end
  end

  # def random
  #   random_one = @merchant_list.sample
  #   random_two = @merchant_list.sample
  #   random_id = ""
  #   total_rows = @merchant_list.count
  #   random_id = rand(total_rows).to_s
  #   random_merchant = @merchant_list.find {|merchant| merchant_list.id = random_id }
  # end

end
