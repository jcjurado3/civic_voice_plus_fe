class BillsController < ApplicationController
  def index
    @user = current_user
    @results = BillFacade.new.bill_search(params[:state], params[:search]).search_results
    # params[:page].to_i
    #render json: {objects:results, meta:pagination_meta(results) }
  end

  def show
    @user = current_user
    @result = BillFacade.new.bill_result(params[:id]).bill_results
    @members = MemberFacade.new.member_result(params[:id]).member_deets
    # require 'pry'; binding.pry
  end
end
