class BillSearch
  attr_reader :search_results

  def initialize(data)
    @search_results = data[:data]
  end
end
