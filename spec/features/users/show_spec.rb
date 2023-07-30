require "rails_helper"

RSpec.describe "User Show Page" do
  describe "happy path" do
    before(:each) do
      @user1 = User.create!(name: "tester", id: 245)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
    end
    it "has select bill topics button" do
      visit dashboard_path

      expect(page).to have_button("select bill topics")

      click_button("select bill topics")
save_and_open_page
      expect(current_path).to eq(user_path(@user1))
    end
  end
end