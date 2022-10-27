module Api
  module V1
    class AccountsController < ApplicationController
      before_action :authenticate_me, only: %i[logout]
      before_action :register_parameters, only: %i[register]
      before_action :login_parameters, only: %i[login]

      def register
        result = ::Api::V1::Account::Register.call(@valid_params)
        return render json: {errors: result.errors}, status: :bad_request if result.errors

        render json: {token: result[:token]}, status: 200
      end

      def login
        result = ::Api::V1::Account::Login.call(@valid_params)
        return render json: {errors: result.errors}, status: :bad_request if result.errors

        render json: {token: result[:token]}, status: 200
      end

      def logout
        result = ::Api::V1::Account::Logout.call(email: @current_user&.email)
        return render json: {errors: result.errors}, status: :bad_request if result.errors

        render json: {message: "Successfully logout."}, status: 200
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
        permited_params = params.permit(:email, :password)
        
        begin
          ::AccountValidation::Login.new(permited_params).validate
        rescue StandardError => e
          return render json: { errors: [e.message]}, status: :bad_request
        end

        @valid_params = permited_params
      end
    end
  end
end
