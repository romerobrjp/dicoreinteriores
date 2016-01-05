class Admin::Preference < ActiveRecord::Base
  belongs_to :user
end
