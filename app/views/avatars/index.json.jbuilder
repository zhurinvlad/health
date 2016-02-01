json.array!(@avatars) do |avatar|
  json.extract! avatar, :id, :name, :sex, :head_id, :body_id
  json.url avatar_url(avatar, format: :json)
end
