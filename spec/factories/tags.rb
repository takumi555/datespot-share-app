FactoryBot.define do
  factory :tag do
    tag_name { Faker::Lorem.characters(number: 5) }
  end
end