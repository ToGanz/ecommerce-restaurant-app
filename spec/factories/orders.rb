FactoryBot.define do
  factory :order do
    paid { false }
    delivered { false }
    canceled { false }
  end
end
