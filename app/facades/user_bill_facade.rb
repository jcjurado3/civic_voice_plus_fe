class UserBillFacade

  def initialize(user_id)
    @user_id = user_id
  end

  def get_user_saved_bills
    user_bills_data = service.get_user_bills(@user_id)
    if user_bills_data == {:data=>[]}
      {}
    else
      user_bills = user_bills_data[:data]

      user_bills.map do |bill|
        bill_result = Bill.new(bill)
        # bill = BillFacade.new.bill_result(bill_result.bill_id).bill_results

      end
    end
  end

  def user_bill_ids
    get_user_saved_bills.map do |bill_data|
      bill_data.bill_id
    end
  end

  private
  def service
    @_service = CvpService.new
  end
end
