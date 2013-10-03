require 'csv'
require_relative '../items/customer.rb'

class CustomerRepo

  attr_reader :customer_list,
              :filename,
              :customers,
              :engine

  def initialize(filename = './data/customers.csv', engine)
    @filename = filename
    @engine   = engine
  end

  %w[id first_name last_name created_at updated_at].each do |attribute|
    define_method("find_by_#{attribute}") do |value|
     all.find do |customer_item|
       customer_item.send(attribute).to_s.downcase == value.to_s.downcase
      end
    end
  end

  %w[id first_name last_name created_at updated_at].each do |attribute|
    define_method("find_all_by_#{attribute}") do |value|
      all.find_all do |customer_item|
        customer_item.send(attribute).to_s.downcase == value.to_s.downcase
      end
    end
  end

  def random
    all.sample
  end

  def customers
    @customer_list ||= build_customers
  end

  def all
    customers
  end

  private

  def read_file
    CSV.read filename, headers: true, header_converters: :symbol
  end

  def build_customers
    customer_list = []

    read_file.each do |row|
      customer_list << Customer.new(row, engine)
    end

    customer_list
  end

end
