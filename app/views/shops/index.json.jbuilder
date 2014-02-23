json.array!(@shops) do |shop|
  json.extract! shop, :id, :name, :category
  json.url shop_url(shop, format: :json)
end
