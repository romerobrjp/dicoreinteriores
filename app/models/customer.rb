class Customer < User

  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip_code
  validates_presence_of :street
  validates_presence_of :street_number
end
