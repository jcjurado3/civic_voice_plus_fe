class BillDetails
  attr_reader :bill_results

  def initialize(data)
    @bill_results = data[:data][:attributes]
  end
end
