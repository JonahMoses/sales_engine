require 'csv'
require_relative '../items/merchant'

class MerchantRepo
  
  attr_reader :filename,
              :merchants,
              :engine

  def initialize(filename = './data/merchants.csv', engine)
    @filename = filename
    @engine   = engine
  end

  %w[id name created_at updated_at].each do |attribute|
    define_method("find_by_#{attribute}") do |value|
      all.find do |merchant|
        merchant.send(attribute).to_s.downcase == value.to_s.downcase
      end
    end
  end

  %w[id name created_at updated_at].each do |attribute|
    define_method("find_all_by_#{attribute}") do |value|
      all.find_all do |merchant|
        merchant.send(attribute).to_s.downcase == value.to_s.downcase
      end
    end
  end

  def find_all_by_id(id)
    merchants_grouped_by_id[id] || []
  end

  def merchants_grouped_by_id 
    @merchants_grouped_by_id ||= all.group_by { |merchant| merchant.id }
  end
    
  def random
    merchants.sample
  end

  def merchants
    @merchants ||= build_merchants
  end

  def all
    merchants
  end

  def most_revenue(quantity)
    revenue_merchants = all.sort_by { |merchant| merchant.revenue }
    revenue_merchants[0,quantity].reverse
  end

  def most_items(quantity)
    items_by_merchants = all.sort_by { |merchant| merchant.items.count }
    items_by_merchants[0,quantity].reverse
  end

  private

  def read_file
    CSV.read filename, headers: true, header_converters: :symbol
  end

  def build_merchants
    merchants = []

    read_file.each do |row|
      merchants << Merchant.new(row, engine)
    end
    
    merchants
  end

end
