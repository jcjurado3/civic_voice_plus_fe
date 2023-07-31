require "rails_helper"

RSpec.describe "User Show Page" do
  describe "happy path" do
    before(:each) do
      @user1 = User.create!(name: "tester", id: 245)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

      WebMock.disable_net_connect!(allow_localhost: true)

      stub_request(:get, "https://civic-voice-plus-bfabe77935f8.herokuapp.com/api/v1/user_category")
      .with(query: { user_id: 245 })
      .to_return(status: 200, body: '{"data":{"categories":["healthcare", "education"], "state":"Florida"}}', headers: {})

      stub_request(:get, "https://civic-voice-plus-bfabe77935f8.herokuapp.com/api/v1/digest_bills")
        .with(query: { user_id: 245, categories: ["healthcare", "education"], state: "Florida" })
        .to_return(status: 200, body: '{
              "data": [
                {
                  "id": "1",
                  "type": "bill",
                  "attributes": {
                    "name": "Bill 1",
                    "status": "Active",
                    "description": "This is bill 1"
                  }
                },
                {
                  "id": "2",
                  "type": "bill",
                  "attributes": {
                    "name": "Bill 2",
                    "status": "Inactive",
                    "description": "This is bill 2"
                  }
                }
              ]
            }', headers: {})
      stub_request(:post, "https://civic-voice-plus-bfabe77935f8.herokuapp.com/api/v1/user_bills").
        with(
          body: "{\"user_id\":245}",
          headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Content-Type'=>'application/json',
          'User-Agent'=>'Faraday v2.7.10'
          }).
        to_return(status: 200, body: '{
          "data": [
            {
              "id": "1",
              "type": "bill",
              "attributes": {
                "name": "Bill 1",
                "status": "Active",
                "description": "This is bill 1"
              }
            },
            {
              "id": "2",
              "type": "bill",
              "attributes": {
                "name": "Bill 2",
                "status": "Inactive",
                "description": "This is bill 2"
              }
            }
          ]
        }', headers: {})
      stub_request(:get, "https://civic-voice-plus-bfabe77935f8.herokuapp.com/api/v1/user_category")
        .with(query: { user_id: 245 })
        .to_return(status: 200, body: '{"data":{"categories":["healthcare", "education"], "state":"Florida"}}', headers: {})


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

      check("healthcare")
      check("education")
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

    it "can edit bill categories" do
      visit user_path(@user1)

      check("healthcare")
      check("education")
      select("Florida", from: "state")

      click_button("Save")

      expect(current_path).to eq(dashboard_path)

      within("#digest-section") do
        expect(page).to have_content("Digest")
        expect(page).to have_content("Appropriations.")
      end

      expect(page).to click_button("Edit My Categories")

      uncheck("healthcare")

      click_button("Save")

      expect(current_path).to eq(dashboard_path)

      within("#digest-section") do
        expect(page).to have_content("Digest")
        expect(page).to_not have_content("Appropriations.")
        expect(page).to have_content("Property Tax Administration")
      end
    end

    after do
      WebMock.allow_net_connect!
    end
  end
end
