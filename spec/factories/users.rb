FactoryGirl.define do
  factory :admin do
    name 'Admin 01'
    surname 'Admin Admin'
    cpf '12345678'
    phone1 '12345678'
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }
  end

  factory :customer do
    name { Faker::Name.first_name }
    surname { Faker::Name.last_name }
    cpf '33333333'
    phone1 '12345678'
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip_code { Faker::Address.zip }
    street { Faker::Address.street_address }
    street_number { Faker::Address.building_number }
  end

end
