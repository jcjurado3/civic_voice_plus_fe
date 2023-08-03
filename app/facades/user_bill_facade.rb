class UserBillFacade

  def initialize(user_id)
    @user_id = user_id
  end

  def get_user_saved_bills
    user_bills_data = service.get_user_bills(@user_id)
    if user_bills_data == "{}"
      {}
    else
      user_bills = user_bills_data[:data]

      user_bills.map do |bill|
        UserBill.new(bill)
      end
    end
  end

  private
  def service
    @_service = CvpService.new
  end
end