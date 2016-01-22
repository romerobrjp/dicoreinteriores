class SpaceType < ActiveRecord::Base

  has_attached_file :picture, styles: {thumb: '240x240#'}
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

  validates_presence_of :name
  validates_attachment_presence :picture

end
