require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require 'csv'

class ItemTest < MiniTest::Test 

  def contents
    CSV.read "./data/items.csv", headers: true, header_converters: :symbol
  end

  def item_attributes
    contents.each do |row|
      id          = row[:id]
      name        = row[:name]
      description = row[:description]
      unit_price  = row[:unit_price]
      merchant_id = row[:merchant_id]
      created_at  = row[:created_at]
      updated_at  = row[:updated_at]
    end
  end

  def item
    item ||= Item.new(item_attributes)
  end

  def test_item_id
    assert_equal item_attributes[:id], item.item_id
  end

  def test_name
    assert_equal item_attributes[:name], item.name
  end

  def test_description
    assert_equal item_attributes[:description], item.description
  end

  def test_unit_price
    assert_equal item_attributes[:unit_price], item.unit_price
  end

  def test_merchant_id
    assert_equal item_attributes[:merchant_id], item.merchant_id
  end

  def test_created_at
    assert_equal item_attributes[:created_at], item.created_at
  end

  def test_updated_at
    assert_equal item_attributes[:updated_at], item.updated_at
  end

end
