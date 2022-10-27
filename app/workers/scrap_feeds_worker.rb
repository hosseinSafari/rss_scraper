require 'sidekiq-scheduler'

class ScrapFeedsWorker
  include Sidekiq::Worker

  def perform
    ::WebsiteRepository::Site.fetch_all&.each do |site|
      ::Api::V1::Website::ScrapFeed.call(site: site)
    end
  end
end
