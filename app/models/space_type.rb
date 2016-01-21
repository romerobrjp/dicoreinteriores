class SpaceType < ActiveRecord::Base

  has_attached_file :picture
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

  validates_presence_of :name
  validates_attachment_presence :picture

end
