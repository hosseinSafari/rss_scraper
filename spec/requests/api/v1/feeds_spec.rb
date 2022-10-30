require 'rails_helper'

RSpec.describe "Api::V1::Feeds", type: :request do
  describe "Index Action" do
    before(:each) do
      sign_in_user
    end

    it "Unauthorized" do

      get "/api/v1/feeds"
      expect(response).to have_http_status(401)
    end

    it "Success" do
      get "/api/v1/feeds",
      headers: {Authorization: @bearer_token}
      expect(response).to have_http_status(:ok)
    end
  end

  describe "Show Action" do
    before(:each) do
      sign_in_user
      @new_site = ::Site.create(url: "site_url.com")
      @new_feed = ::Feed.create(title: "title1",
                                url: "feed_url.com",
                                description: "It's a description.",
                                site_id: @new_site&.id)
    end

    it "Unauthorized" do

      get "/api/v1/feeds/#{@new_feed&.id}"
      expect(response).to have_http_status(401)
    end

    it "BadRequest --> the current user dosn't register for the above site." do
      get "/api/v1/feeds/#{@new_feed&.id}",
      headers: {Authorization: @bearer_token}
      expect(response).to have_http_status(:bad_request)
    end

    it "BadRequest --> feed not found." do
      get "/api/v1/feeds/#{-3}",
      headers: {Authorization: @bearer_token}
      expect(response).to have_http_status(:bad_request)
    end


    it "Success" do
      @new_user_site = ::UserSite.create(user: @current_user, site: @new_site)
      get "/api/v1/feeds/#{@new_feed&.id}",
      headers: {Authorization: @bearer_token}
      expect(response).to have_http_status(:bad_request)
    end
  end
end
