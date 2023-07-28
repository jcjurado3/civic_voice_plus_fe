class UsersController < ApplicationController
  def index
    @user = current_user

    if @user.nil?
      redirect_to root_path
      flash[:error] = "You must be logged in to view this page"
    end
  end
end