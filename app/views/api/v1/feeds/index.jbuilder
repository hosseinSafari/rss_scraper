json.partial! 'api/v1/pagination/pagination_info', list: @feeds

json.feeds @feeds.each do |feed|
  json.partial! "api/v1/feeds/feed", feed: feed
end