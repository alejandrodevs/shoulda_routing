json.array!(@likes) do |like|
  json.extract! like, 
  json.url like_url(like, format: :json)
end
