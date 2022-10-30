# frozen_string_literal: true

module ControllerHelper
    def sign_in_user
        @current_user = ::User.create( email: Faker::Internet.email ,password: "123456", password_confirmation: "123456" )
        @token = @current_user&.generate_token
        ::SessionRepository::Session.create({user: @current_user, token: @token})
        @bearer_token = 'bearer ' + @token
    end
  end
  