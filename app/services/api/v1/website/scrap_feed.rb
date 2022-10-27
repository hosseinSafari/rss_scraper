module Api
    module V1
        module Website
            require 'rss'
            require 'open-uri'

            class ScrapFeed
                include Peafowl

                attribute :site, ::Site

                validates :site, presence: true

                def call

                    url = "#{@site&.url}/rss"
                    URI.open(url) do |rss|
                        feed = RSS::Parser.parse(rss)
                        feed.items.each do |item|
                            params = {title: item.title, url: item.link, description: item.description, site_id: @site.id}
                            @feed = ::FeedRepository::Feed.find_or_create(params)
                            
                            ::WebsiteRepository::Site.current_site_users(@site.id)&.each do |user|
                                ::UserFeedRepository::UserFeed.create({user: user, feed: @feed})
                            end
                        end
                    end 

                end
            end
        end
    end
end