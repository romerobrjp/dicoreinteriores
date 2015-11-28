class Post < ActiveRecord::Base
  acts_as_taggable
  acts_as_taggable_on :tags

  belongs_to :author, class_name: 'Admin'

  has_attached_file :main_image, styles: {cropped: '1920x470#'}, default_url: "/default_assets/post_main_image.png"
  validates_attachment_content_type :main_image, content_type: /\Aimage\/.*\Z/

  validates_presence_of :title
  validates_presence_of :body
  validates_presence_of :author_id
  validates_associated :author

  paginates_per 10

  def self.published_ordered
    Post.where(draft: false).order('created_at DESC')
  end

end
