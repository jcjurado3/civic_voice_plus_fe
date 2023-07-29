require "rails_helper"

RSpec.describe "dashboard index page" do 
  describe "happy path" do
    before(:each) do
      @user1 = User.create!(name: "tester")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
  
      visit dashboard_path
    end
    it "has welcome message" do 
      expect(page).to have_content("Welcome #{@user1.name}")
    end
    it "has nav bar buttons" do 
      within("#nav-bar") do
        expect(page).to have_button("Home")
        expect(page).to have_button("Search Bills")
        expect(page).to have_button("My Dashboard")
        expect(page).to have_button("Sign Out")
      end  
    end

    it "has edit my categories button" do
      within("#digest-section") do
        expect(page).to have_button("Choose My Categories")
      end
    end

    it "has digest section with bills" do
      within("#digest-section") do
        expect(page).to have_content("Bill 1")
        expect(page).to have_content("Bill 2")
      end
    end

    it "has saved bill section" do
      within("#saved-bills") do
        expect(page).to have_content("Saved Bill 1")
        expect(page).to have_content("Saved Bill 2")
      end
    end
  end
  
  describe "sad path" do
    it "dashboard redirects if user is not logged in" do
      visit dashboard_path

      expect(page).to have_content("You must be logged in to view this page")
      expect(current_path).to eq(root_path)
    end
  end

end
