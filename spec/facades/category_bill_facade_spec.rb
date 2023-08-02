require "rails_helper"

RSpec.describe CategoryBillFacade do
  describe "class methods" do
    describe "#get_user_category_bills" do
      it "returns all categories associated to a specific user", :vcr do
        user_id = 1
        user_cats = CategoryBillFacade.new(user_id).get_user_category_bills
        require 'pry'; binding.pry
      end
    end
  end
end