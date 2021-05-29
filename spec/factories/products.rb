FactoryBot.define do
  factory :product do
    name { Faker::Alphanumeric.alpha(number: 10) }
    description { Faker::Food.description }
    price { Faker::Number.decimal(l_digits: 2) }
    vegetarian { false }
    vegan { false }
    available { true }
    featured { false }
    image { nil }
    category
  end
end
