FactoryBot.define do
  factory :product do
    name { "MyString" }
    description { "MyText" }
    price { "9.99" }
    vegetarian { false }
    vegan { false }
    available { false }
    featured { false }
  end
end
