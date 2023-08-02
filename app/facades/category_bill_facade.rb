class CategoryBillFacade
  
  def initialize(user_id)
    @user_id = user_id
  end

  def get_user_category_bills
    user_category_data ||= service.get_user_category(@user_id)

    if user_category_data == {:data=>[]}
      {}
    else
# require 'pry'; binding.pry
      categories = user_category_data[:data][:categories]
      state = user_category_data[:data][:state]
  
      digest_bills_data ||= service.get_digest_bills(@user_id, categories, state)
  
      digest_bills = digest_bills_data[:data]
  
      digest_bills.map do |bill|
        UserBill.new(bill)
      end
    end
    
  end

  private
    def service
      @_service = CvpService.new
    end

end