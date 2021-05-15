class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  before_save :set_total

  private

  def set_total
    self[:total] = line_items.to_a.sum { |item| item.total }
  end

end
