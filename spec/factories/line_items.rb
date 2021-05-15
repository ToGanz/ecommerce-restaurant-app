FactoryBot.define do
  factory :line_item do
    product 
    order
    unit_price { Faker::Number.decimal(l_digits: 2) }
    quantity { Faker::Number.between(from: 1, to: 10) }
  end
end
