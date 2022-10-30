require 'rails_helper'

RSpec.describe "Api::V1::Accounts", type: :request do

  describe "Register Action" do
    before(:each) do
      ::Role.find_or_create_by(name: :normal)
    end

    it "Success" do
      post "/api/v1/accounts/register", params: { email: Faker::Internet.email, password: "123456", password_confirmation: "123456" }
      expect(response).to have_http_status(:ok)
    end

    it "If you don't send email through parameters, it raises an error." do
      post "/api/v1/accounts/register", params: { password: "123456", password_confirmation: "123456" }
      expect(response).to have_http_status(:bad_request)
    end
  end

  describe "Login Action" do
    before(:each) do
      @new_user = ::User.create( email: Faker::Internet.email ,password: "123456", password_confirmation: "123456" )
    end

    it "Success" do
      get "/api/v1/accounts/login", params: { email: @new_user.email, password: "123456"}
      expect(response).to have_http_status(:ok)
    end

    it "If you don't send email through parameters, it raises an error." do
      get "/api/v1/accounts/login", params: {password: "123456"}
      expect(response).to have_http_status(:bad_request)
    end
  end
end
