class UserCategoriesController < ApplicationController
  def create
    @user = current_user

    categories = params[:categories]
    state = params[:state]
    if state.present?
      CvpService.new.save_state(@user.id, state)
    end
    if categories.present?
      selected_categories = categories.select { |category_id, selected| selected == "1" }.keys.map(&:to_i)
      deselected_categories = categories.select { |category_id, selected| selected == "0" }.keys.map(&:to_i)

      selected_categories.each do |category_id|
        CvpService.new.save_category(@user.id, category_id)
      end

      deselected_categories.each do |category_id|
        CvpService.new.remove_category(@user.id, category_id)
      end
      flash[:notice] = 'Categories saved successfully.'
    else
      flash[:alert] = 'No categories selected.'
    end

    redirect_to dashboard_path
  end
end