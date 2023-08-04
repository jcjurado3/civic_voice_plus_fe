require "rails_helper"

RSpec.describe "bills index", type: :feature do
  let!(:user1) { User.create!(name: "Chill", id: 88, email: "killa@bill.com", token: "", google_id: 7) }

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
  end

  it "displays a search form to find bills by topic and region", :vcr do
    visit bills_path

    expect(page).to have_button("Search Bills")

    click_button("Search Bills")

    expect(current_path).to eq(bills_path)
    expect(page).to have_content("Search by topic")
    expect(page).to have_content("Select region")
    expect(page).to have_button("Search")
  end

  it 'returns a *paginated* search results after fields have been selected', :vcr do
    visit bills_path

    fill_in(:search, with: "guns")
    select("Florida", from: "state")
    click_button("Search")

    expect(page).to have_content("Bill Name: HB331")
    expect(page).to have_link("HB331")
    expect(page).to have_content("Description: Provides relative to automatic weapons (EN INCREASE GF EX See Note)")
  end

  it "has a bookmark button to save a bill to a user", :vcr do
    visit bills_path

    fill_in(:search, with: "guns")
    select("Florida", from: "state")
    click_button("Search")

    expect(page).to have_button("save HB331 to my dashboard") #<---bookmark fxn
  end
end
