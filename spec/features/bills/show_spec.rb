require "rails_helper"

RSpec.describe "bills show", type: :feature do
  let!(:user1) { User.create!(name: "Chill", id: 88, email: "killa@bill.com", token: "", google_id: 7) }

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
  end

  it 'displays bills information', :vcr do
    visit bill_path(1689711)

    expect(page).to have_content("Bill Name: Assault Weapons and Large-capacity Magazines")
    expect(page).to have_content("Status: Introduced")
    expect(page).to have_content("Summary: Prohibiting the sale or transfer of an assault weapon or a large-capacity magazine; prohibiting possession of an assault weapon or a large-capacity magazine; requiring certificates of possession for assault weapons or large-capacity magazines lawfully possessed before a specified date; providing conditions for continued possession of such weapons or large-capacity magazines; providing enhanced criminal penalties for certain offenses when committed with an assault weapon or a large-capacity magazine, etc.")
    expect(page).to have_button("Check out the Full Text Here!")
    expect(page).to have_content("Sen/Rep Lori Berman")
  end

  it 'should display the link to profile, email and an image of each representative sponsor', :vcr do
    visit bill_path(1689711)

    expect(page).to have_content('Click here to Contact Lori Berman')
    expect(page).to have_content('Click here to Contact Tina Polsky')
    expect(page).to have_link('Lori Berman')
    expect(page).to have_link('Tina Polsky')
  end
end

# As a logged in user, when I click a search result’s bill name, it is a link that
# redirects me to the bill’s show page. When I visit ‘bills/:id’ I see the bill’s name,
# status, and a simplified description of the bill.
# I also see a section that shows the congressperson who sponsored it - displaying a
# photo of the congressperson, their name, and their contact information.
# Additionally I see a button that will route me to the full text of the bill.