class BillFacade
  def initialize(params)
    # require 'pry'; binding.pry
    @params = params
  end

  def bill_search
    bill_search = BillService.new(@params).bills_by_query
    # require 'pry'; binding.pry
    bill_objects = []
    bill_search[:searchresult].drop(1).each do |bill_data|
      # require 'pry'; binding.pry
      bill_hash = {id: bill_data.first.to_s.to_i,
        attributes: bill_data.last }
        bill_object = ApiBill.new(bill_hash)
        bill_objects << bill_object
      
      create_bills(bill_data.last)
    end
      bill_objects
  end

  def bill_result
    bill_search = BillService.new(@params).bills_by_id
    bill_hash = { id: bill_search[:bill][:bill_id],
      attributes: bill_search[:bill]
    }
    
    update_bill(bill_hash)
    ApiBill.new(bill_hash)
  end

  # def bill_search(state, topic)
  #   BillSearch.new(service.search_url(state, topic))
  # end

  # def bill_result(bill_id)
  #   BillDetails.new(service.bill_url(bill_id))
  # end

  private
  
  def create_bills(bill_data)
    bill1 = Bill.find_or_create_by(bill_id: bill_data[:bill_id]) do |b|
      b.bill_number = bill_data[:bill_number]
      b.text_url = bill_data[:text_url]
      b.last_action_date = bill_data[:last_action_date]
      b.last_action = bill_data[:last_action]
      b.title = bill_data[:title]
      b.state = bill_data[:state]
      b.sponsors = bill_data[:sponsors]
      b.status = bill_data[:status]
      b.texts = bill_data[:texts]
      b.description = bill_data[:description]
    end
  end

  def update_bill(bill_data)
    bill = Bill.find_by(bill_id: bill_data[:bill_id])
    if bill
      bill.update(
        bill_number: bill_data[:bill_number],
        text_url: bill_data[:text_url],
        last_action_date: bill_data[:last_action_date],
        last_action: bill_data[:last_action],
        title: bill_data[:title],
        state: bill_data[:state],
        sponsors: bill_data[:sponsors],
        status: bill_data[:status],
        texts: bill_data[:texts],
        description: bill_data[:description]
      )
    end
  end
end
