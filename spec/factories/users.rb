FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password(min_length: 6, max_length: 128) }

    confirmed_at { DateTime.now }

    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    admin { false }
    approved { false }
  end
end
