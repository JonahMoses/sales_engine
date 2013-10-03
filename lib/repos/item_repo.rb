require 'csv'
require_relative '../items/item.rb'

class ItemRepo

  attr_reader :item_list,
              :filename,
              :items,
              :engine

  def initialize(filename = './data/items.csv', engine)
    @filename = filename
    @engine   = engine
  end

  %w[id name description merchant_id created_at updated_at].each do |attribute|
    define_method("find_by_#{attribute}") do |value|
      all.find do |item|
        item.send(attribute).to_s.downcase == value.to_s.downcase
      end
    end
  end

  %w[id name description merchant_id created_at updated_at].each do |attribute|
    define_method("find_all_by_#{attribute}") do |value|
      all.find_all do |item|
        item.send(attribute).to_s.downcase == value.to_s.downcase
      end
    end
  end

  def find_all_by_merchant_id(merchant_id)
    items_grouped_by_merchant[merchant_id] || []
  end

  def items_grouped_by_merchant
    @items_grouped_by_merchant ||= all.group_by { |item| item.merchant_id }
  end

  def find_by_unit_price(value)
    all.find do |item|
      item.unit_price == value
    end
  end

  def find_all_by_unit_price(value)
    all.select do |item|
      item.unit_price == value
    end
  end

  def random
    all.sample
  end

  def items
    @item_list ||= build_items
  end

  def all
    items
  end

  def most_revenue(quantity)
    revenue_items = all.sort_by { |item| item.revenue }
    revenue_items[0,quantity].reverse
  end

  def most_items(quantity)
    items_by_quantity = all.sort_by { |item| item.quantity_sold }
    items_by_quantity[0,quantity].reverse
  end

private

  def read_file
    CSV.read filename, headers: true, header_converters: :symbol
  end

  def build_items
    items = []

    read_file.each do |row|
      items << Item.new(row, engine)
    end

    items
  end

end
