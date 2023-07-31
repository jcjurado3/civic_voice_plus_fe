class UserCategoriesController < ApplicationController
  def create
    @user = current_user

    categories = params[:categories]

    if categories.present?
      selected_categories = categories.select { |category, selected| selected == "1" }.keys
      deselected_categories = categories.select { |category, selected| selected == "0" }.keys

      selected_categories.each do |category|
        CvpService.new.save_category(@user.id, category)
      end

      deselected_categories.each do |category|
        CvpService.new.remove_category(@user.id, category)
      end
      flash[:notice] = 'Categories saved successfully.'
    else
      flash[:alert] = 'No categories selected.'
    end

    redirect_to user_path 
  end
end