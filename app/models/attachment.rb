class Attachment < ActiveRecord::Base
  has_attached_file :file
  belongs_to :attachable, polymorphic: true

  validates_attachment_presence :file
  do_not_validate_attachment_file_type :file
end
