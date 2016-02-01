json.array!(@bodies) do |body|
  json.extract! body, :id, :image
  json.url body_url(body, format: :json)
end
