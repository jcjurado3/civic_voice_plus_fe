class UserCategoriesController < ApplicationController
  def create
    @user = current_user

    categories = params[:categories]

    if categories.present?
      categories.each do |category|
        CvpService.new.save_category(@user.id, category)
      end
      flash[:notice] = 'Categories saved successfully.'
    else
      flash[:alert] = 'No categories selected.'
    end

    redirect_to user_path 
  end
end