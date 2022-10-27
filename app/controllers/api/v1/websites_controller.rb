module Api
    module V1
        class WebsitesController < ApplicationController
            before_action :authenticate_me, only: %i[add_url]
            before_action :add_url_parameters, only: %i[add_url]

            def add_url
                result = ::Api::V1::Website::AddUrl.call(@valid_params)
                return render json: {errors: result.errors}, status: :bad_request if result.errors
        
                render json: {message: "Website's url added."}, status: 200 
            end

            private

            def add_url_parameters
                permited_params = params.permit(:url)
                
                begin
                  ::WebsiteValidation::AddUrl.new(permited_params).validate
                rescue StandardError => e
                  return render json: { errors: [e.message]}, status: :bad_request
                end
        
                @valid_params = permited_params.merge(current_user: @current_user)
            end
        end
    end
end
