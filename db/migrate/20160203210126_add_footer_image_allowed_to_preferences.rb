class AddFooterImageAllowedToPreferences < ActiveRecord::Migration
  def change
    add_column :preferences, :footer_image_allowed, :boolean, default: false
  end
end
