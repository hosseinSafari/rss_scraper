module Api
    module V1
        module Feed
            class Fetch
                include Peafowl

                attribute :current_user, ::User

                validates :current_user, presence: true

                def call
                    @user_feeds = ::UserFeedRepository::UserFeed.fetch_by_user_id(@current_user.id)
                    context[:user_feeds] = @user_feeds
                end
                
            end
        end
    end
end