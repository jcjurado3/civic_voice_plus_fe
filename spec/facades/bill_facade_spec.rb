require 'rails_helper'

describe 'bill facade' do
  let!(:user1) { User.create!(name: "Chill", id: 88, email: "kill@bill.com", token: "", google_id: 7) }

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
  end

  it 'should return up to 50 records from a search query', :vcr do
    expect(BillFacade.new.bill_search('FL', 'guns')).to be_a(Object)
    expect(BillFacade.new.bill_search('FL', 'guns').search_results).to be_a(Array)
    expect(BillFacade.new.bill_search('FL', 'guns').search_results.count).to eq(41)
    expect(BillFacade.new.bill_search('FL', 'guns').search_results[0]).to have_key(:attributes)
    expect(BillFacade.new.bill_search('FL', 'guns').search_results[0]).to have_value("bill")
  end

  it 'should return a bill by bill_id', :vcr do
    expect(BillFacade.new.bill_result(1689711)).to be_a(Object)
    expect(BillFacade.new.bill_result(1689711).bill_results).to be_a(Hash)
    expect(BillFacade.new.bill_result(1689711).bill_results).to have_key(:bill_number)
    expect(BillFacade.new.bill_result(1689711).bill_results).to have_value("S0462")
    expect(BillFacade.new.service).to be_a(Object)
  end

end
