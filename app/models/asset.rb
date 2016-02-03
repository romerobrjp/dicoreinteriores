class Asset < ActiveRecord::Base
  has_attached_file :file, {
    url: "/system/:class/:id/:hash.:extension",
    hash_secret: "string_for_obfuscation_from_hell"
  }

  validates_attachment_presence :file
  do_not_validate_attachment_file_type :file
end
