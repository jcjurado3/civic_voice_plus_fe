require "rails_helper"

RSpec.describe "dashboard index page" do 
  before(:each) do
    @user1 = User.create!(name: "tester")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

    visit dashboard_path
  end
  describe "happy path" do
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
        expect(page).to have_button("Edit My Categories")
      end
    end
  end
end
