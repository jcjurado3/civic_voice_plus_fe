require 'rails_helper'

describe 'bill facade' do
  let!(:user1) { User.create!(name: "Chill", id: 88, email: "kill@bill.com", token: "", google_id: 7) }

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
  end

  it 'should return up to 50 records from a search query', :vcr do
    bills = BillFacade.new.bill_search('FL', 'guns')

    expect(bills).to be_an(Array)

    bills.each do |bill|
      expect(bill).to be_a(Bill)
      expect(bill.type).to eq("bill")
      expect(bill.id).to be_a(String)
      expect(bill.bill_id).to be_an(Integer)
      expect(bill.bill_number).to be_a(String)
      expect(bill.name).to be_a(String)
      expect(bill.state).to be_a(String)
      expect(bill.status).to be_a(String)
      expect(bill.description).to eq(nil)
      expect(bill.sponsors).to eq(nil)
      expect(bill.texts).to eq(nil)
    end
  end

  it 'should return a bill by bill_id', :vcr do
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
