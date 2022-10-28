module Api
    module V1
        module Feed
            module Interfaces
                require 'rss'
                require 'open-uri'

                
                class IscrapFeeds
                    def scrap
                        raise "Implement the scrap method."
                    end
                end

            end
        end
    end
end