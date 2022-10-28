module Api
    module V1
        module Feed
            class Create
                include Peafowl

                attribute :title, ::String
                attribute :url, ::String
                attribute :description, ::String
                attribute :site_id, ::String

                validates :title, presence: true
                validates :url, presence: true
                validates :description, presence: true
                validates :site_id, presence: true

                def call
                    @feed = ::FeedRepository::Feed.find_or_create(parameters)
        
                    ::WebsiteRepository::Site.current_site_users(@site_id)&.each do |user|
                        ::UserFeedRepository::UserFeed.create({user: user, feed: @feed})
                    end
                end

                def parameters
                    {title: @title, url: @url, description: @description, site_id: @site_id}
                end
                
            end
        end
    end
end