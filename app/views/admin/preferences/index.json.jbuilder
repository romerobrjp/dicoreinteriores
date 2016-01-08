json.array!(@admin_preferences) do |admin_preference|
  json.extract! admin_preference, :id, :color_1, :color_2, :color_3, :color_4, :color_5, :user_id
  json.url admin_preference_url(admin_preference, format: :json)
end
