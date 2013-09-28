require 'csv'
require './lib/items/customer.rb'

class CustomerRepo
  attr_reader :customer_list,
              :filename,
              :customers
              # :sales_engine

  def initialize(filename = './data/customers.csv')
    @filename = filename
    # @sales_engine = sales_engine
  end

  # %w[id item_id invoice_id quantity unit_price created_at updated_at].each do |attribute|
  #   define_method("find_by_#{attribute}") do |value|
  #     invoice_item_objects.find do |invoice_items|
  #       invoice_items.send(attribute).to_s.downcase == value.downcase
  #     end
  #   end
  # end

  # %w[id item_id invoice_id quantity unit_price created_at updated_at].each do |attribute|
  #   define_method("find_all_by_#{attribute}") do |value|
  #     invoice_item_objects.find_all do |invoice_items|
  #       invoice_items.send(attribute).to_s.downcase == value.downcase
  #     end
  #   end
  # end

  def random
    customer_objects.sample
  end

  def customer_items
    customer_objects
  end

  private

  def read_file
    @customers = CSV.read "./data/customers.csv", headers: true, header_converters: :symbol
  end

  def customer_objects
    @customer_list = []
    read_file.each do |row|
      @customer_list << Customer.new(row)
    end
    return @customer_list
  end

end
