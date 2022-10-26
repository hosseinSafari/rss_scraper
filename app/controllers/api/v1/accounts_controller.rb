module Api
  module V1
    class AccountsController < ApplicationController
      before_action :authenticate_me, only: %i[login]

      def register

      end

      def login

      end

      private

      def register_parameters
        params.permit(:email, :password, :password_confirmation)
      end

      def login_parameters
        params.permit(:email, :password)
      end
    end
  end
end
