require 'csv'
require_relative '../items/item.rb'

class ItemRepo
  
  attr_reader :item_list,
              :filename,
              :items,
              :engine

  def initialize(filename = './data/items.csv')
    @filename = filename
    # @engine = engine
  end

  %w[id name description unit_price merchant_id created_at updated_at].each do |attribute|
    define_method("find_by_#{attribute}") do |value|
      item_objects.find do |item|
        item.send(attribute).to_s.downcase == value.downcase
      end
    end
  end

  %w[id name description unit_price merchant_id created_at updated_at].each do |attribute|
    define_method("find_all_by_#{attribute}") do |value|
      item_objects.find_all do |item|
        item.send(attribute).to_s.downcase == value.downcase
      end
    end
  end

  def random
    item_objects.sample
  end

  def items
    item_objects
  end

  private

  def read_file
    @items = CSV.read "./data/items.csv", headers: true, header_converters: :symbol
  end

  def item_objects
    @item_list = []
    read_file.each do |row|
      @item_list << Item.new(row)
    end
    return @item_list
  end

end
