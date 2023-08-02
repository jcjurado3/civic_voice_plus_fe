require "rails_helper"

RSpec.describe CategoryFacade do
  describe "class methods" do
    describe "#get_all_categories" do
      it "returns all categories", :vcr do
        user_categories = CategoryFacade.new.get_all_categories

        expect(user_categories).to be_an(Array)
        expect(user_categories.count).to eq(16)

        expect(user_categories.first).to be_an(Category)
        expect(user_categories.first.id).to be_a(String)
        expect(user_categories.first.id).to eq("1")
        expect(user_categories.first.name).to be_a(String)
        expect(user_categories.first.name).to eq("artificial intelligence")
      end
    end
  end  
end