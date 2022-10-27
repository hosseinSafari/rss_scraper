module Api
    module V1
        module Feed
            class Fetch
                include Peafowl

                attribute :current_user, ::User

                validates :current_user, presence: true

                def call
                    @feeds = ::FeedRepository::Feed.current_user_feeds(@current_user.email)
                    context[:feeds] = @feeds
                end
                
            end
        end
    end
end