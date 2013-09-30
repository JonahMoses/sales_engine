require 'csv'
require_relative '../items/merchant'

class MerchantRepo
  
  attr_reader :merchant_list,
              :filename,
              :merchants,
              :engine

  def initialize(filename = './data/merchants.csv', engine)
    @filename = filename
    @engine = engine
  end

  %w[id name created_at updated_at].each do |attribute|
    define_method("find_by_#{attribute}") do |value|
      merchant_objects.find do |merchant|
        merchant.send(attribute).to_s.downcase == value.to_s.downcase
      end
    end
  end

  %w[id name created_at updated_at].each do |attribute|
    define_method("find_all_by_#{attribute}") do |value|
      merchant_objects.find_all do |merchant|
        merchant.send(attribute).to_s.downcase == value.to_s.downcase
      end
    end
  end

  def random
    merchant_objects.sample
  end

  def merchants
    merchant_list ||= merchant_objects
  end

  def all
    merchants
  end

  private

  def read_file
    @merchants = CSV.read filename, headers: true, header_converters: :symbol
  end

  def merchant_objects
    @merchant_list = []
    read_file.each do |row|
      @merchant_list << Merchant.new(row, engine)
    end
    return @merchant_list
  end

end
