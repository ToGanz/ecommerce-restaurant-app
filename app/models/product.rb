class Product < ApplicationRecord
  belongs_to :category
  has_one_attached :image
  
  validates :name, presence: true, uniqueness: true
  validates :description, length: { maximum: 500, too_long: "%{count} characters is the maximum allowed" }
  validates :name, length: { maximum: 140, too_long: "%{count} characters is the maximum allowed" }
end
