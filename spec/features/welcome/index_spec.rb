require 'rails_helper'

RSpec.describe "landing page" do
  before :each do
    visit root_path
  end

  it 'has a link to log in' do

      expect(page).to have_link("Login")

  end
end