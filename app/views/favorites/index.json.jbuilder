json.array!(@favorites) do |favorite|
  json.extract! favorite, :id, :post_id, :user_id
  json.url favorite_url(favorite, format: :json)
end
