require 'sidekiq'
require 'sidekiq/web'
require 'sidekiq-cron'

sidekiq_config = { url: "redis://#{ENV['REDIS_HOST']}:#{ENV['REDIS_PORT']}" }

Sidekiq.configure_server do |config|
  config.redis = sidekiq_config
end

Sidekiq.configure_client do |config|
  config.redis = sidekiq_config
end

Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
  [user, password] == [ENV['SIDEKIQ_USERNAME'], ENV['SIDEKIQ_PASSWORD']]
end
