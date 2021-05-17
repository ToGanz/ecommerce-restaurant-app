class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy

  validates :street, length: { maximum: 140, too_long: "%{count} characters is the maximum allowed" }
  validates :zip, length: { is: 5 }, allow_blank: true
  validates :city, length: { maximum: 80, too_long: "%{count} characters is the maximum allowed" }
  
  def subtotal
    line_items.to_a.sum { |item| item.total }
  end

  def number_of_items
    line_items.to_a.sum { |item| item.quantity }
  end

  def set_total
    self[:total] = subtotal
  end

end
