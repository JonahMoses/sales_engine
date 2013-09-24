require 'csv'

class MerchantRepo

  @merchant_list = []
  @search_results = []

  def initialize
  end

  def load(filename)
    merchant_list = CSV.read filename, headers: true, header_converters: :symbol
    return filename
  end

  def find_id(id)
    @id
  end

  # def merchant_attributes
  #   contents.each do |row|
  #     merchant_id   = row[:id]
  #     merchant_name = row[:name]
  #     created_at    = row[:created_at]
  #     updated_at    = row[:updated_at]
  #   end
  # end



end
