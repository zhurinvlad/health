json.array!(@heads) do |head|
  json.extract! head, :id, :image
  json.url head_url(head, format: :json)
end
