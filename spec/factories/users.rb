FactoryBot.define do
  factory :user do
    username { Faker::Lorem.characters(number: 6) }
    email { Faker::Internet.email }
    password { 'password' }
  end
end
