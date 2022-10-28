module Api
    module V1
        module Feed

            class CreateScrapedFeeds < Interfaces::IscrapFeeds
                
                def initialize(site)
                    raise TypeError, 'ScrapFeeds expects an ::Site type.' unless site.is_a?(::Site)

                    @site = site
                end

                def scrap

                    url = "#{@site&.url}/rss"
                    URI.open(url) do |rss|
                        feed = RSS::Parser.parse(rss)
                        feed.items.each do |item|
                            ::CreateFeedWorker.new.perform(item.title, item.link, item.description, @site.id)
                        end
                    end 
                end
            end
        end
    end
end