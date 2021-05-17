FactoryBot.define do
  factory :category do
    name { Faker::Food.unique.dish }
    description { Faker::Food.description }
    display { true }
  end
end
