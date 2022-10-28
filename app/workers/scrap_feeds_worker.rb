require 'sidekiq-scheduler'

class ScrapFeedsWorker
  include Sidekiq::Worker

  def perform
    ::WebsiteRepository::Site.fetch_all&.each do |site|
      ::Api::V1::Feed::CreateScrapedFeeds.new(site).scrap
    end
  end
end
