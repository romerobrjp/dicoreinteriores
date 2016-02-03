class Preference < ActiveRecord::Base
  belongs_to :admin

  validates_uniqueness_of :specific_id
  validates_presence_of :color_1
  validates_presence_of :color_2
  validates_presence_of :color_3

  has_attached_file :header_image
  has_attached_file :footer_image

  validates_attachment :header_image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png", "image/svg"] }
  validates_attachment :footer_image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png", "image/svg"] }
end
