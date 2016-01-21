include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :space_type do
    name { Faker::Hipster.word }
    picture { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'test.png'), 'image/png') }
  end

end
