require 'rails_helper'

RSpec.describe "Api::V1::Websites", type: :request do
  describe "Login Action" do
    before(:each) do
      sign_in_user
    end

    it "Success" do
      post "/api/v1/websites/add_url", 
      params: { url: "https://news.ycombinator.com/" },
      headers: {Authorization: @bearer_token}
      
      expect(response).to have_http_status(:ok)
    end
  end
end
