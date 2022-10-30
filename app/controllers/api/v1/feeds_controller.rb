module Api
    module V1
        class FeedsController < ApplicationController
            before_action :authenticate_me
            before_action :create_comment_parameters, only: %i[comment]

            def index
                result = ::Api::V1::Feed::Fetch.call(current_user: @current_user)
                return render json: {errors: result.errors}, status: :bad_request if result.errors
        
                @user_feeds = result[:user_feeds]&.page(params[:page] || 0).per(params[:per] || 10) 
            end

            def show
                result = ::Api::V1::Feed::Get.call(current_user: @current_user, id: params[:id])
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

            def comment_list
                result = ::Api::V1::Feed::CommentList.call(id: params[:id], current_user: @current_user)
                return render json: {errors: result.errors}, status: :bad_request if result.errors
                return render json: {message: "No one has commented yet!"}, status: :ok unless result[:comments].present?

                @comments = Kaminari.paginate_array(result[:comments])&.page(params[:page] || 0).per(params[:per] || 10)
                render "api/v1/comments/list"
            end

            def comment
                result = ::Api::V1::Feed::CreateComment.call(@valid_params&.merge(id: params[:id], current_user: @current_user))
                return render json: {errors: result.errors}, status: :bad_request if result.errors

                render json: {message: "comment has been added."}, status: 200
            end

            private

            def create_comment_parameters
                permited_params = params.permit(:description)
                
                begin
                  ::FeedValidation::CreateComment.new(permited_params).validate
                rescue StandardError => e
                  return render json: { errors: [e.message]}, status: :bad_request
                end
        
                @valid_params = permited_params
              end
        end
    end
end
