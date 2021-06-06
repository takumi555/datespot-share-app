FactoryBot.define do
  factory :answer do
    content { Faker::Lorem.characters(number: 20) }
    user
    question
  end
end
