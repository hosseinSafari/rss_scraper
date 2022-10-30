module Api
    module V1
        module Feed
            class Get
                include Peafowl

                attribute :id, ::String
                attribute :current_user, ::User

                validates :id, presence: true
                validates :current_user, presence: true

                def call
                    @feed_id = @id
                    @user_feed = ::UserFeedRepository::UserFeed.find_by_relation_ids(@current_user, @feed_id)
                    return add_error!("Feed with id=#{@id} not found for current user.") if @user_feed.nil?

                    context[:user_feed] = @user_feed
                end
                
            end
        end
    end
end