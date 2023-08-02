require "rails_helper"

RSpec.describe CategoryFacade do
  describe "class methods" do
    describe "#get_all_categories" do
      it "returns all categories", :vcr do
        categories = CategoryFacade.new.get_all_categories

        expect(categories).to be_an(Array)
        expect(categories.count).to eq(16)

        expect(categories.first).to be_an(Category)
        expect(categories.first.id).to be_a(String)
        expect(categories.first.id).to eq("1")
        expect(categories.first.name).to be_a(String)
        expect(categories.first.name).to eq("artificial intelligence")
      end
    end
  end  
end