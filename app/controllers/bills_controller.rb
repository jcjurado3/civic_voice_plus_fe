class BillsController < ApplicationController
  def index
    @user = current_user
    results = BillFacade.new.bill_search(params[:search], params[:state]).mock_search
    @results = results #.page(params[:page] ? params[:page].to_i : 1)
    #render json: {objects:results, meta:pagination_meta(results) }
    # require 'pry'; binding.pry
  end
end