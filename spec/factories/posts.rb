FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.sentence(3) }
    introduction {Faker::Lorem.sentence(40)}
    body {Faker::Lorem.paragraph(10)}
    association :author, factory: :admin
  end
end
