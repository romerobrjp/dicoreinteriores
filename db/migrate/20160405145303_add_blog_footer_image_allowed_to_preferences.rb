class AddBlogFooterImageAllowedToPreferences < ActiveRecord::Migration
  def change
    add_column :preferences, :blog_footer_image_allowed, :boolean, default: false
  end
end
