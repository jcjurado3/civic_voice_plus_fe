class CategoryBillFacade
  
  def initialize(user_id)
    @user_id = user_id
  end

  def get_user_category_bills
    user_category_data ||= service.get_user_category(@user_id)

    user_category = user_category_data[:data]

    user_category.map do |category|
      Category.new(category)
    end
  end

  private
    def service
      @_service = CvpService.new
    end

end