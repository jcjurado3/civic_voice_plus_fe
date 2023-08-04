class CategoryBillFacade
  
  def initialize(user_id)
    @user_id = user_id
  end

  def get_user_category_bills
    user_category_data = service.get_user_category(@user_id)
    if user_category_data == {:data=>[]}
      {}
    else
      categories = []
      user_category_data[:data].each do |category|
        categories << category[:attributes][:name]
      end
      categories = categories.join(' or ')
      categories
      state_results = CvpService.new.get_user_state(@user_id)
      if state_results != {:data=>[]}
        state = state_results[:data].first[:attributes][:state_abbr]
        digest_bills_data = service.get_digest_bills(@user_id, categories, state)
  # require 'pry'; binding.pry
        digest_bills = digest_bills_data[:data]
    
        digest_bills.map do |bill|
          UserBill.new(bill)
        end
      end
    end
    
  end

  private
    def service
      @_service = CvpService.new
    end

end
