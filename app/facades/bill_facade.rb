class BillFacade
  def bill_search(state, topic)
    bills = service.search_url(state, topic)
    bills[:data].map do |bill_data|
      Bill.new(bill_data)
    end
    # BillSearch.new(bill)
  end

  def bill_result(bill_id)
    bill_data = service.bill_url(bill_id)
    Bill.new(bill_data[:data])
    # BillDetails.new(service.bill_url(bill_id))
  end

  def service
    CvpService.new
  end
end
