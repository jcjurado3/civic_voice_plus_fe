class BillsController < ApplicationController
  def index
    @user = current_user
    @results = BillFacade.new.bill_search(params[:state], params[:search]).search_results

  end

  def show
    @user = current_user
    @result = BillFacade.new.bill_result(params[:id]).bill_results
    # require 'pry'; binding.pry
    @members = MemberFacade.new.member_result(params[:id]).member_deets
    # require 'pry'; binding.pry
    @saved_bills = UserBillFacade.new(@user.id).get_user_saved_bills
  end
end
