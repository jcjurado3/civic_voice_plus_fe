class CategoryBillFacade
  
  def initialize(user_id)
    @user_id = user_id
  end

  def get_categories
    category_ids = get_category_ids(@user_id)
    find_categories(category_ids)
  end

  def get_category_ids(user_id)
    UserCategory.where(user_id: user_id).pluck(:category_id)
  end

  def find_categories(category_ids)
    Category.where(id: category_ids)
  end

  def get_states
    state_ids = get_state_ids(@user_id)
    find_states(state_ids)
  end

  def get_state_ids(user_id)
    UserState.where(user_id: user_id).pluck(:state_id)
  end

  def find_states(state_ids)
    State.where(id: state_ids)
  end

  def get_digest_bills
    categories = get_categories
    state = get_states
    params = {
      state: state,
      query: categories
    }
    bill_search = BillService.new(params).bills_by_query
    bill_objects = []
    bill_search[:searchresult].drop(1).each do |bill_data|
      bill_hash = {id: bill_data.first.to_s.to_i,
        attributes: bill_data.last }
        bill_object = ApiBill.new(bill_hash)
        bill_objects << bill_object
      
      create_bills(bill_data.last)
    end
      bill_objects
  end

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

  # def get_user_category_bills
  #   user_category_data = service.get_user_category(@user_id)
  #   if user_category_data == {:data=>[]}
  #     {}
  #   else
  #     categories = []
  #     user_category_data[:data].each do |category|
  #       categories << category[:attributes][:name]
  #     end
  #     categories = categories.join(' or ')
  #     categories
  #     state_results = CvpService.new.get_user_state(@user_id)
  #     if state_results != {:data=>[]}
  #       state = state_results[:data].first[:attributes][:state_abbr]
  #       digest_bills_data = service.get_digest_bills(@user_id, categories, state)
  #       digest_bills = digest_bills_data[:data]
    
  #       digest_bills.map do |bill|
  #         UserBill.new(bill)
  #       end
  #     end
  #   end
    
  # end

  # private
  #   def service
  #     @_service = CvpService.new
  #   end

end
