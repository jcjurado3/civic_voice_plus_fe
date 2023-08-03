class UserBillsController < ApplicationController
  # params[:page], default: 1
  def create
    @user = current_user
    bill_id = params[:bill_id]
    # require 'pry'; binding.pry
    CvpService.new.save_bill(@user.id, bill_id)
    flash[:notice] = 'Bill saved successfully.'
  end

  def destroy
    @user = current_user
    bill_id = params[:bill_id]
    CvpService.new.unsave_bill(@user.id, bill_id)
    flash[:notice] = 'Bill unsaved successfully.'
  end
end