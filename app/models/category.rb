class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :featured_products, -> { Product.featured }, class_name: 'Product', inverse_of: :category
  
  validates :name, presence: true, uniqueness: true
  validates :description, length: { maximum: 500, too_long: "%{count} characters is the maximum allowed" }
  validates :name, length: { maximum: 140, too_long: "%{count} characters is the maximum allowed" }
end
