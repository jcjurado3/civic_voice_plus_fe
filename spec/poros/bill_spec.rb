require "rails_helper"

RSpec.describe Bill do
  describe "existance" do
    it "has attributes and exists", :vcr do
      bill = BillFacade.new.bill_result(1689711)
      
      expect(bill).to be_a(Bill)
      expect(bill.type).to eq("bill")
      expect(bill.id).to be_a(String)
      expect(bill.bill_id).to be_an(Integer)
      expect(bill.bill_number).to be_a(String)
      expect(bill.name).to be_a(String)
      expect(bill.state).to be_a(String)
      expect(bill.status).to eq(nil)
      expect(bill.description).to be_a(String)
      expect(bill.sponsors).to be_an(Array)
      expect(bill.texts).to be_an(Array)
    end
  end
end