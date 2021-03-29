FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.characters(number: 20)}
    user
    post
  end
end