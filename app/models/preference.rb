class Preference < ActiveRecord::Base
  belongs_to :admin

  validates_uniqueness_of :specific_id
  validates_presence_of :color_1
  validates_presence_of :color_2
  validates_presence_of :color_3
end
