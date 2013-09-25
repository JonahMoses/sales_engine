require 'csv'
require './lib/items/merchant.rb'

class MerchantRepo
  attr_reader :merchant_list,
              :filename,
              :merchants

  def initialize(filename = './data/merchants.csv')
    @filename = filename
  end

  def self.build_find_by_methods
    %w[id name created_at updated_at].each do |attribute|
      define_method("find_by_#{attribute}") do |value|
        merchant_objects.find do |merchant|
          merchant.send(attribute).downcase == value.downcase
        end
      end
    end
  end

   def self.build_find_all_by_methods
    %w[id name created_at updated_at].each do |attribute|
      define_method("find_all_by_#{attribute}") do |value|
        merchant_objects.find_all do |merchant|
          merchant.send(attribute).downcase == value.downcase
        end
      end
    end
  end

  def random
    merchant_objects.sample
  end

  def merchants
    merchant_objects
  end

  build_find_by_methods
  build_find_all_by_methods

  private

  def read_file
    @merchants = CSV.read "./data/merchants.csv", headers: true, header_converters: :symbol
  end

  def merchant_objects
    @merchant_list = []
    read_file.each do |row|
      @merchant_list << Merchant.new(row)
    end
    return @merchant_list
  end

end
