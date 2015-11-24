json.array!(@assets) do |asset|
  json.extract! asset, :id
  json.url admin_asset_url(asset, format: :json)
end
