class CategoryFacade

  def get_user_category(user_id)
    category_result = CvpService.new.get_user_category(user_id)
    category_result[:data].map do |category|

      Category.new(category)
    end
  end
  def get_all_categories
    categories_data = service.get_all_categories

    if categories_data == {:data=>[]}
      {}
    else
      categories = categories_data[:data]

      categories.map do |category|
        
        Category.new(category)
      end
    end
  end

  def get_user_state(user_id)
    state_result = CvpService.new.get_user_state(user_id)
    if state_result != {:data=>[]}
      state = state_result[:data].first[:id].to_i
    end
  end

  private
  def service
    @_service = CvpService.new
  end
end
