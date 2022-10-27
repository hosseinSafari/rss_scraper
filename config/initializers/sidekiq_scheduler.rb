require 'sidekiq'
require 'sidekiq-scheduler'

Sidekiq.configure_server do |config|
  config.on(:startup) do
    Sidekiq.schedule = YAML.load_file(File.expand_path('config/sidekiq_scheduler.yml'))
    SidekiqScheduler::Scheduler.instance.reload_schedule!
  end
end
