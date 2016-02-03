class AddHeaderImageAllowedToPreferences < ActiveRecord::Migration
  def change
    add_column :preferences, :header_image_allowed, :boolean, default: false
  end
end
