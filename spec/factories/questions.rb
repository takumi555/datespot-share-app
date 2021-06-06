FactoryBot.define do
  factory :question do
    title { Faker::Lorem.characters(number: 10) }
    content { Faker::Lorem.characters(number: 30) }
    user
  end
end
