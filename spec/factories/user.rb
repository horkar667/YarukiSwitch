FactoryBot.define do
  factory :user do
    last_name { Faker::Lorem.characters(number: 2) }
    first_name { Faker::Lorem.characters(number: 2) }
    last_name_kana { Faker::Lorem.characters(number: 4) }
    first_name_kana { Faker::Lorem.characters(number: 4) }
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(number: 15) }
  end
end
