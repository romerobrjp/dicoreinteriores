class Category < ActiveRecord::Base
  has_many :posts

  validates_presence_of :name

  def self.header_categories
    Category.where(show_on_header: true)
  end

end
