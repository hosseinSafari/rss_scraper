json.partial! 'api/v1/pagination/pagination_info', list: @user_feeds

json.feeds @user_feeds.each do |user_feed|
  json.partial! "api/v1/feeds/feed", user_feed: user_feed
end