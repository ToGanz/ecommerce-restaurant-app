class Product < ApplicationRecord
  validates :name, presence: true
  validates :description, length: { maximum: 500, too_long: "%{count} characters is the maximum allowed" }
  validates :name, length: { maximum: 140, too_long: "%{count} characters is the maximum allowed" }
end
