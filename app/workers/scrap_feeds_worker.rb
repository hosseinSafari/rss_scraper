require 'sidekiq-scheduler'

class ScrapFeedsWorker
  include Sidekiq::Worker

  def perform
    # WebsiteRepository
    #
    # This worker runs automatically every 5 minutes in the background.
    # Fetch all of the sites that exist in the database,
    # and scrapes every feed in separate jobs.
    ::WebsiteRepository::Site.fetch_all&.each do |site|
      ::Api::V1::Feed::CreateScrapedFeeds.new(site).scrap
    end
  end
end
