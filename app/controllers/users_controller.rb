class UsersController < ApplicationController
  def index
    @user = current_user
    if @user.present?
      @digest_bills = CategoryBillFacade.new(@user.id).get_user_category_bills
      @saved_bills = UserBillFacade.new(@user.id).get_user_saved_bills
    else
      redirect_to root_path
      flash[:error] = "You must be logged in to view this page"
    end
  end

  def show
    @user = current_user
    @all_categories = CategoryFacade.new.get_all_categories
    @selected_categories = CvpService.new.get_user_category(@user.id).map { |c| c[:category] }
  end
end