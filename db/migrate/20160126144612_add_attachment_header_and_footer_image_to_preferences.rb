class AddAttachmentHeaderAndFooterImageToPreferences < ActiveRecord::Migration
  def up
    add_attachment :preferences, :header_image
    add_attachment :preferences, :footer_image
  end

  def down
    remove_attachment :preferences, :header_image
    remove_attachment :preferences, :footer_image
  end
end
