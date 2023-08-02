class CategoryFacade
  def get_all_categories
    categories_data ||= service.get_all_categories

    if categories_data == "{}"
      {}
    else
      categories = categories_data[:data]

      categories.map do |category|

        Category.new(category)
      end
    end
  end

  private
  def service
    @_service = CvpService.new
  end
end