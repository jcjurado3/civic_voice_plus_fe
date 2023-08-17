class BillsController < ApplicationController
  def index
    @user = current_user
    results = BillFacade.new.bill_search(params[:state], params[:search])
    @paginated_bills = Kaminari.paginate_array(results).page(params[:page])
    @saved_bills = UserBillFacade.new(@user.id).user_bill_ids
  end

  def show
    @user = current_user
    @result = BillFacade.new.bill_result(params[:id])

    @members = MemberFacade.new.member_result(params[:id]).member_deets

    @saved_bills = UserBillFacade.new(@user.id).user_bill_ids
  end
end
