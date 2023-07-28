require 'rails_helper'

RSpec.describe "landing page" do
  before :each do
    visit root_path
  end

  it 'has a link to log in' do
    within "#Login" do
      expect(page).to have_content("Login")
    end
  end
end