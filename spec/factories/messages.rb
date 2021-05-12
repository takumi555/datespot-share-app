FactoryBot.define do
  factory :message do
    content { Faker::Lorem.characters(number: 20)}
    user
    room
  end
end
