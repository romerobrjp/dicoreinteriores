class Post < ActiveRecord::Base
  acts_as_taggable
  acts_as_taggable_on :tags

  validates_presence_of :title
  validates_presence_of :body

end
