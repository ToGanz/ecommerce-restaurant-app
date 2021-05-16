class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy


  def subtotal
    line_items.to_a.sum { |item| item.total }
  end

  def set_total
    self[:total] = subtotal
  end

end
