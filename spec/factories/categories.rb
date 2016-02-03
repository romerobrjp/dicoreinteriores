FactoryGirl.define do
  factory :category do
    name { Faker::Hipster.sentence(2) }
  end
end
