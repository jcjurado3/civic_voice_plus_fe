require "rails_helper"

RSpec.describe "dashboard index page" do 
  describe "happy path" do
    before(:each) do
      @user1 = User.create!(name: "tester", id: 245)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

      # stub_request(:get, "http://localhost:3000/api/v1/user_bills?user_id=245").
      #   with(
      #     headers: {
      #   'Accept'=>'*/*',
      #   'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      #   'User-Agent'=>'Faraday v2.7.10'
      #     }).
      #   to_return(status: 200, body: "", headers: {})
    end
    it "has welcome message" do 
      visit dashboard_path

      expect(page).to have_content("Welcome #{@user1.name}")
    end
    it "has nav bar buttons" do 
      visit dashboard_path

      within("#nav-bar") do
        expect(page).to have_button("Home")
        expect(page).to have_button("Search Bills")
        expect(page).to have_button("My Dashboard")
        expect(page).to_not have_button("Log In")
        expect(page).to have_button("Sign Out")
      end  
    end
    it "has Sign Out button" do
      visit dashboard_path

      click_button("Sign Out")

      expect(current_path).to eq(root_path)
    end

    it "has edit my categories button" do
      visit dashboard_path

      within("#digest-section") do
        expect(page).to have_button("Choose My Categories")
      end
    end

    it "has digest section without bills" do
      visit dashboard_path

      within("#digest-section") do
        expect(page).to have_content("Digest")
        expect(page).to have_button("select bill topics")
      end
    end

    it "has digest section with bills" do
      visit dashboard_path

      click_button("select bill topics")

      check("Healthcare")
      check("Taxes")
      select("Florida", from: "state")

      click_button("Save")

      expect(current_path).to eq(dashboard_path)

      within("#digest-section") do
        expect(page).to have_content("Digest")
        expect(page).to_not have_button("select bill topics")
        expect(page).to have_content("Appropriations.")
      end
    end

    xit "has saved bill section" do
      visit dashboard_path

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

      expect(page).to have_button("Log In")
    end
  end

end
