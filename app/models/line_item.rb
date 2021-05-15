class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  before_save :set_unit_price
  before_save :set_total

  private

  def set_unit_price
    # is there already is a record, dont the the unit price
    if persisted?
      self[:unit_price]
    else
      self[:unit_price] = product.price
    end
  end

  def set_total
    self[:total] = unit_price * quantity
  end

end
