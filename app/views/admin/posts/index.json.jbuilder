json.array!(@posts) do |post|
  json.extract! post, :id
  json.url admin_post_url(post, format: :json)
end
