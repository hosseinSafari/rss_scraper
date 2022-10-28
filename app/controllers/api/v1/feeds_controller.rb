module Api
    module V1
        class FeedsController < ApplicationController
            before_action :authenticate_me

            def index
                result = ::Api::V1::Feed::Fetch.call(current_user: @current_user)
                return render json: {errors: result.errors}, status: :bad_request if result.errors
        
                @user_feeds = result[:user_feeds]&.page(params[:page] || 0).per(params[:per] || 10) 
            end

            def show
                result = ::Api::V1::Feed::Show.call(current_user: @current_user, id: params[:id])
                return render json: {errors: result.errors}, status: :bad_request if result.errors
        
                @user_feed = result[:user_feed]
            end

            def favorit
                result = ::Api::V1::Feed::Favorit.call(id: params[:id], current_user: @current_user)
                return render json: {errors: result.errors}, status: :bad_request if result.errors

                @user_feed = result[:user_feed]
                render "api/v1/feeds/show"
            end

            def read
                result = ::Api::V1::Feed::Read.call(id: params[:id], current_user: @current_user)
                return render json: {errors: result.errors}, status: :bad_request if result.errors

                @user_feed = result[:user_feed]
                render "api/v1/feeds/show"
            end

            def bookmark
                result = ::Api::V1::Feed::Bookmark.call(id: params[:id], current_user: @current_user)
                return render json: {errors: result.errors}, status: :bad_request if result.errors

                @user_feed = result[:user_feed]
                render "api/v1/feeds/show"
            end
        end
    end
end
