class CreateFeedWorker
	include Sidekiq::Worker
	sidekiq_options queue: 'update_feed'
	
	def perform(title, url, description, site_id)
        params = {title: title, url: url, description: description, site_id: site_id}
        ::Api::V1::Feed::Create.call(params)
    end
end