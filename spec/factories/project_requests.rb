FactoryGirl.define do
  factory :project_request do
    association :customer, factory: :customer
    association :space_type, factory: :space_type
    description { Faker::Lorem.paragraph(5) }
  end
end
