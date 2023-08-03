class UsersController < ApplicationController
  def index
    @user = current_user
    if @user.present?
      @digest_bills = CategoryBillFacade.new(@user.id).get_user_category_bills
      @selected_categories = CategoryBillFacade.new(@user.id).get_user_category_bills
      @saved_bills = UserBillFacade.new(@user.id).get_user_saved_bills
      # require 'pry'; binding.pry
    else
      redirect_to root_path
      flash[:error] = "You must be logged in to view this page"
    end
  end

  def show
    @user = current_user
    @all_categories = CategoryFacade.new.get_all_categories

    @selected_categories = CategoryFacade.new.get_user_category(@user.id)
    @selected_category_ids = @selected_categories.map { |category| category.id.to_i }
    @selected_state = CategoryFacade.new.get_user_state(@user.id)
  end
end