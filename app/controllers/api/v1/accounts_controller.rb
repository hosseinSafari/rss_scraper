module Api
  module V1
    class AccountsController < ApplicationController
      before_action :authenticate_me, only: %i[login]
      before_action :register_parameters, only: %i[register]

      def register
        result = ::Api::V1::Account::Register.call(@valid_params)
        return render json: {errors: result.errors}, status: :bad_request if result.errors

        render json: {token: result[:token]}, status: 200
      end

      def login

      end

      private

      def register_parameters
        permited_params = params.permit(:email, :password, :password_confirmation)
        
        begin
          ::AccountValidation::Register.new(permited_params).validate
        rescue StandardError => e
          return render json: { errors: [e.message]}, status: :bad_request
        end

        @valid_params = permited_params
      end

      def login_parameters
        params.permit(:email, :password)
      end
    end
  end
end
