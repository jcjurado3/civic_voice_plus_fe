class BillFacade
  def bill_search(state, topic)

    BillSearch.new(service.search_url(state, topic))
  end

  def bill_result(bill_id)
    BillDetails.new(service.bill_url(bill_id))
  end

  def service
    CvpService.new
  end
end
