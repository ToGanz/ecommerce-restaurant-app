class Product < ApplicationRecord
  belongs_to :category
  has_many :line_items
  has_one_attached :image
  
  validate :acceptable_image
  validates :name, presence: true, uniqueness: true
  validates :description, length: { maximum: 500, too_long: "%{count} characters is the maximum allowed" }
  validates :name, length: { maximum: 140, too_long: "%{count} characters is the maximum allowed" }

  scope :featured, -> { where(featured: true) }

  private

  def acceptable_image
    return unless image.attached?

    if image.byte_size > 1.megabyte
      errors.add(:image, "is too big")
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(image.content_type)
      errors.add(:image, "must be a JPEG or PNG")
    end
  end

end

