class ProjectRequest < ActiveRecord::Base
  include AASM

  belongs_to :customer
  belongs_to :space_type
  has_many :attachments, as: :attachable, dependent: :delete_all
  enum status: [:draft, :for_approval, :approved, :denied]

  aasm column: :status, enum: true do
    state :draft, initial: true
    state :for_approval
    state :approved
    state :denied
  end

  validates_presence_of :customer
  validates_presence_of :space_type
  validates_presence_of :description

  accepts_nested_attributes_for :attachments

  scope :from_customer, ->(customer) { where(customer: customer) }

end
