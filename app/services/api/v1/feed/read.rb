module Api
    module V1
        module Feed
            class Read
                include Peafowl

                attribute :id, ::String
                attribute :current_user, ::User

                validates :id, presence: true
                validates :current_user, presence: true

                def call
                    @feed_id = @id
                    @user_feed = ::UserFeedRepository::UserFeed.find_by_relation_ids(@current_user.id, @feed_id)
                    return add_error!("Feed with id=#{@id} not found for current user.") if @user_feed.nil?

                    read_status = @user_feed&.read&.present? ? false : true
                    ::UserFeedRepository::UserFeed.update(@user_feed.id, {read: read_status})
                    
                    context[:user_feed] = @user_feed&.reload
                end
                
            end
        end
    end
end