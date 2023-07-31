class BillSearch
  attr_reader :search_results, :mock_search

  def initialize(data)
    @search_results = data[:attributes]
    @mock_search = data[:searchresult]
  end
end
