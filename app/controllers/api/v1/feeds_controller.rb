module Api
    module V1
        class FeedsController < ApplicationController
            before_action :authenticate_me

            def index
                result = ::Api::V1::Feed::Fetch.call(current_user: @current_user)
                return render json: {errors: result.errors}, status: :bad_request if result.errors
        
                @feeds = result[:feeds]&.page(params[:page] || 0).per(params[:per] || 10) 
            end

            def show
                result = ::Api::V1::Feed::Show.call(id: params[:id])
                return render json: {errors: result.errors}, status: :bad_request if result.errors
        
                @feed = result[:feed]
            end
        end
    end
end
