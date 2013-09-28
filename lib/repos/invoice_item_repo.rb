require 'csv'
require './lib/items/invoice_items.rb'

class InvoiceItemRepo
  attr_reader :invoice_item_list,
              :filename,
              :invoice_items
              # :sales_engine

  def initialize(filename = './data/invoice_items.csv')
    @filename = filename
    # @sales_engine = sales_engine
  end

  %w[id item_id invoice_id quantity unit_price created_at updated_at].each do |attribute|
    define_method("find_by_#{attribute}") do |value|
      invoice_item_objects.find do |invoice_items|
        invoice_items.send(attribute).to_s.downcase == value.downcase
      end
    end
  end

  %w[id item_id invoice_id quantity unit_price created_at updated_at].each do |attribute|
    define_method("find_all_by_#{attribute}") do |value|
      invoice_item_objects.find_all do |invoice_items|
        invoice_items.send(attribute).to_s.downcase == value.downcase
      end
    end
  end

  def random
    invoice_item_objects.sample
  end

  def invoice_items
    invoice_item_objects
  end

  private

  def read_file
    @invoice_items = CSV.read "./data/invoice_items.csv", headers: true, header_converters: :symbol
  end

  def invoice_item_objects
    @invoice_items_list = []
    read_file.each do |row|
      @invoice_items_list << InvoiceItems.new(row)
    end
    return @invoice_items_list
  end

end
