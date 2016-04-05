class AddBlogHeaderImageAllowedToPreferences < ActiveRecord::Migration
  def change
    add_column :preferences, :blog_header_image_allowed, :boolean, default: false
  end
end
