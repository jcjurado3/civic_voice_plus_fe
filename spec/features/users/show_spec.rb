require "rails_helper"

RSpec.describe "User Show Page" do
  describe "happy path" do
    before(:each) do
      @user1 = User.create!(name: "tester", id: 245)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
    end
    it "has select bill topics button" do
      visit dashboard_path

      expect(page).to_not have_content("Edit My Categories")
      expect(page).to have_button("select bill topics")

      click_button("select bill topics")

      expect(current_path).to eq(user_path(@user1))
    end

    it "select bill topics and save" do
      visit user_path(@user1)

      check("Healthcare")
      check("Taxes")
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
  end
end