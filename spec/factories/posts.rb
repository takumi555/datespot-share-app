FactoryBot.define do
  factory :post do
    title { Faker::Lorem.characters(number: 10) }
    prefecture {'東京都'}
    content { Faker::Lorem.characters(number: 30)}
    user
  end
end