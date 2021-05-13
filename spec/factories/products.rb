FactoryBot.define do
  factory :product do
    name { Faker::Food.dish }
    description { Faker::Food.description }
    price { Faker::Number.decimal(l_digits: 2) }
    vegetarian { false }
    vegan { false }
    available { true }
    featured { false }
  end
end
