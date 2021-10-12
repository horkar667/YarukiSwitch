FactoryBot.define do
  factory :word do
    word { Faker::Lorem.characters(number:15) }
    user
  end
end