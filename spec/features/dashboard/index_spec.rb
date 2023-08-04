require "rails_helper"

RSpec.describe "dashboard index page" do 
  describe "happy path" do
    before(:each) do
      @user1 = User.create!(name: "tester")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

    end
    it "has welcome message", :vcr do 
      visit dashboard_path

      expect(page).to have_content("Welcome #{@user1.name}")
    end
    it "has nav bar buttons", :vcr do 
      visit dashboard_path

      within("#nav-bar") do
        expect(page).to have_button("Home")
        expect(page).to have_button("Search Bills")
        expect(page).to have_button("My Dashboard")
        expect(page).to_not have_button("Log In")
        expect(page).to have_button("Sign Out")
      end  
    end
    it "has Sign Out button", :vcr do
      visit dashboard_path

      click_button("Sign Out")

      expect(current_path).to eq(root_path)
    end

    it "has digest section without bills", :vcr do
      visit dashboard_path

      within("#digest-section") do
        expect(page).to have_content("Digest")
        expect(page).to have_button("select bill topics")
      end
    end

    it "has digest section with bills", :vcr do
      visit dashboard_path

      click_button("select bill topics")

      check("categories[1]")
      check("categories[4]")
      select("Florida", from: "state")
      click_button("Save")

      expect(current_path).to eq(dashboard_path)

      within("#digest-section") do
        expect(page).to have_content("Digest")
        expect(page).to_not have_button("select bill topics")
        expect(page).to have_content("Bill Title: Appropriations ")
      end
    end

    xit "has saved bill section", :vcr do
      visit dashboard_path
      click_button("Search Bills")
      save_and_open_page
      within("#saved-bills") do
        expect(page).to have_content("Saved Bill 1")
        expect(page).to have_content("Saved Bill 2")
      end
    end
  end
  
  describe "sad path" do
    it "dashboard redirects if user is not logged in", :vcr do
      visit dashboard_path

      expect(page).to have_content("You must be logged in to view this page")
      expect(current_path).to eq(root_path)

      expect(page).to have_button("Log In")
    end
  end

end
