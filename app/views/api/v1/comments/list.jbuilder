json.partial! 'api/v1/pagination/pagination_info', list: @comments

json.feed do
  json.id @comments&.first&.feed.id
  json.title @comments&.first&.feed.title
  json.description @comments&.first&.feed.description
  json.site_id @comments&.first&.feed&.site&.id
end

json.comments @comments.each do |comment|
  json.partial! "api/v1/comments/comment", comment: comment
end