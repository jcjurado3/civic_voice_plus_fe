class UsersController < ApplicationController
  def index
    @user = current_user
    @digest_bills = CategoryBillFacade.new(@user.id).get_user_category_bills if @user.present?
    @saved_bills = UserBillFacade.new(@user.id).get_user_saved_bills if @user.present?

    if @user.nil?
      redirect_to root_path
      flash[:error] = "You must be logged in to view this page"
    end


  end
end