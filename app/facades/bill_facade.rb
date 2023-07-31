class BillFacade
  def bill_search(search, state)
    BillSearch.new(service.search_url(search, state))
  end 
  
  def service
    CvpService.new
  end
end
