class UserBillFacade

  def initialize(user_id)
    @user_id = user_id
  end



  def get_bills
    bill_ids = get_bill_ids(@user_id)
    find_bills(bill_ids)
  end

  def get_bill_ids(user_id)
    UserBill.where(user_id: user_id).pluck(:bill_id)
  end

  def find_bills(bill_ids)
    Bill.where(id: bill_ids)
  end

  # def get_user_saved_bills
  #   user_bills_data = service.get_user_bills(@user_id)
  #   if user_bills_data == {:data=>[]}
  #     {}
  #   else
  #     user_bills = user_bills_data[:data]

  #     user_bills.map do |bill|
  #       bill_result = UserBill.new(bill)
  #       bill = BillFacade.new.bill_result(bill_result.bill_id).bill_results
  #     end
  #   end
  # end

  # private
  # def service
  #   @_service = CvpService.new
  # end
end
