json.array!(@space_types) do |space_type|
  json.extract! space_type, :id
  json.url admin_space_type_url(space_type, format: :json)
end
