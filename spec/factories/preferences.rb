FactoryGirl.define do
  factory :preference do
    color_1 { Faker::Color.hex_color }
    color_2 { Faker::Color.hex_color }
    color_3 { Faker::Color.hex_color }
    specific_id { Faker::Hipster.word }
  end
end
