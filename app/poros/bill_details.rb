class BillDetails
  attr_reader :bill_results

  def initialize(data)
    require 'pry'; binding.pry
    @bill_results = data[:data][:attributes]
  end
end
