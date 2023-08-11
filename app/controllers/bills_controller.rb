class BillsController < ApplicationController
  def index
    @user = current_user
    @results = BillFacade.new(params).bill_search
    # require 'pry'; binding.pry
  end

  def show
    @user = current_user
    @result = BillFacade.new(params).bill_result
    # require 'pry'; binding.pry
    @members = MemberFacade.new.member_result(params[:id]).member_deets
    # require 'pry'; binding.pry
  end
end
