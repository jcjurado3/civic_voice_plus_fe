require "rails_helper"

RSpec.describe "User Show Page" do
  describe "happy path" do
    before(:each) do
      @user1 = User.create!(name: "tester", id: 245)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
    end
    it "has select bill topics button", :vcr do
      visit dashboard_path

      expect(page).to_not have_content("Edit My Categories")
      expect(page).to have_button("select bill topics")

      click_button("select bill topics")

      expect(current_path).to eq(user_path(@user1))
    end

    it "select bill topics and save", :vcr do
      visit user_path(@user1)

      check("categories[1]")
      check("categories[4]")
      select("Florida", from: "state")
      
      click_button("Save")

      expect(current_path).to eq(dashboard_path)

      within("#digest-section") do
        expect(page).to have_content("Digest")
        expect(page).to have_content("Appropriations.")
      end

      expect(page).to have_content("Edit My Categories")
      expect(page).to_not have_button("select bill topics")
    end

    it "can edit bill categories", :vcr do
      visit user_path(@user1)

      check("categories[1]")
      check("categories[4]")
      select("Florida", from: "state")

      click_button("Save")

      expect(current_path).to eq(dashboard_path)

      within("#digest-section") do
        expect(page).to have_content("Digest")
        expect(page).to have_content("Appropriations.")
      end

      expect(page).to click_button("Edit My Categories")

      uncheck("categories[4]")

      click_button("Save")

      expect(current_path).to eq(dashboard_path)

      within("#digest-section") do
        expect(page).to have_content("Digest")
        expect(page).to_not have_content("Appropriations.")
        expect(page).to have_content("Property Tax Administration")
      end
    end

  end
end
