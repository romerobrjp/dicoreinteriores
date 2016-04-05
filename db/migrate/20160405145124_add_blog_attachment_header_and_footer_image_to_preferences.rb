class AddBlogAttachmentHeaderAndFooterImageToPreferences < ActiveRecord::Migration
  def up
    add_attachment :preferences, :blog_header_image
    add_attachment :preferences, :blog_footer_image
  end

  def down
    remove_attachment :preferences, :blog_header_image
    remove_attachment :preferences, :blog_footer_image
  end
end
