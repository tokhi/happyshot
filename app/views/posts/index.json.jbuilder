json.array!(@posts) do |post|
  json.extract! post, :id, :description, :image, :tags
  json.url post_url(post, format: :json)
end
