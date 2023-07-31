require "rails_helper"

RSpec.describe "bills index", type: :feature do
  let!(:user1) { User.create!(name: "Chill", id: 88, email: "killa@bill.com", token: "", google_id: 7) }

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
  end

  it "displays a search form to find bills by topic and region", :vcr do
    # body = "\"0\':{\'relevance\':100,\'state\':\'NC\',\'bill_number\':\'H823\',\'bill_id\':1756429,\'change_hash\':\'5e6c12edd02ebf9c48f0c5cf2dcb3042\',\'url\':\'https://legiscan.com/NC/bill/H823/2023\',\'text_url\':\'https://legiscan.com/NC/text/H823/2023\',\'research_url\':\'https://legiscan.com/NC/research/H823/2023\',\'last_action_date\':\'0000-00-00\',\'last_action\':\'Ref To Com On Rules and Operations of the Senate\',\'title\':\'Choose Your School, Choose Your Future\'}"
    # stub_request(:get, "https://api.legiscan.com/?key=c2f34727aabf37f67164d7029b2fa3c0&op=getSearch&state=FL&query=guns")
    # .to_return(status: 200, body: body, headers: {})
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

    expect(page).to have_content("Bill Name: S0462")
    expect(page).to have_link("S0462")
    expect(page).to have_content("Description: Assault Weapons and Large-capacity Magazines")
  end

  it "has a bookmark button to save a bill to a user", :vcr do
    visit bills_path

    fill_in(:search, with: "guns")
    select("Florida", from: "state")
    click_button("Search")

    expect(page).to have_button("save S0462 to my dashboard") #<---bookmark fxn
  end
end
# As a logged in user, I can search bills by topic and region. When I click the button “search bills” 
# it routes me to visit ‘/bills’ (bills index) I see a form to search for house/senate bills by keyword 
# and I also see a drop-down selector to choose a state. When I fill in the search with ‘workers rights’ 
# and the default region is auto selected ‘everywhere’. When I click the “search” button, the page renders 
# with the up to 50 search results matching that search criteria in descending order of ‘last action’ where 
# the most recently updated bill is first. I can see multiple pages of bills to click through to find bills 
# based on my search criteria. Each page has at most 10 results per page. For each bill I see it’s name, 
# a truncated short description, and a bookmark icon. Each bills name is a link to that bills show page.