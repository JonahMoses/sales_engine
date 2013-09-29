require 'csv'
require_relative '../items/customer.rb'

class CustomerRepo
  
  attr_reader :customer_list,
              :filename,
              :customers,
              :engine

  def initialize(filename = './data/customers.csv')
    @filename = filename
    # @engine = engine
  end

  %w[id first_name last_name created_at updated_at].each do |attribute|
    define_method("find_by_#{attribute}") do |value|
     customer_objects.find do |customer_item|
       customer_item.send(attribute).to_s.downcase == value.downcase
      end
    end
  end

  %w[id first_name last_name created_at updated_at].each do |attribute|
    define_method("find_all_by_#{attribute}") do |value|
      customer_objects.find_all do |customer_item|
        customer_item.send(attribute).to_s.downcase == value.downcase
      end
    end
  end

  def random
    customer_objects.sample
  end

  def customer_items
    customer_objects
  end

  def all
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
