require 'csv'
require 'pry'
require './lib/merchant.rb'

class MerchantRepo
  attr_reader :merchant_list,
              :search_results

  def initialize(filename)
    @merchant_list  = []
    @search_results = []
    load(filename)
  end

  def load(filename)
    @merchant_list = CSV.read filename, headers: true, header_converters: :symbol
    return @merchant_list
  end

  def find_merchant_id(id)
    @merchant_list.each do |merchant_hash|
      if merchant_hash[:id] == id
        @search_results << Merchant.new(merchant_hash)
      end
    end
  end

  def find_merchant_name(name)
    @merchant_list.each do |merchant_hash|
      if merchant_hash[:name] == name
        @search_results << Merchant.new(merchant_hash)
      end
    end
  end

  def find_merchant_created_at(created_at)
    @merchant_list.each do |merchant_hash|
      if merchant_hash[:created_at] == created_at
        @search_results << Merchant.new(merchant_hash)
      end
    end
  end

end
