require "rails_helper"

RSpec.describe UserBillFacade do
  describe "class methods" do
    describe "#get_user_saved_bills" do
      it "returns all bills saved to a user's profile", :vcr do
        bills = UserBillFacade.new(1).get_user_saved_bills
      end
    end
  end
end