class Manga < ApplicationRecord
  has_many :chapters, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  # Ensure ratings are between 0 and 5
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  
  # Validate presence of required fields
  validates :title, :author, :first_published_date, :description, presence: true
  
  # Validate that category is an array with a maximum of 3 items
  validate :category_count

  def average_rating
    ratings.average(:rating).to_f
  end

  def increment_views
    self.increment!(:views_count)
  end

  private

  def category_count
    if category.length > 3
      errors.add(:category, "can't have more than 3 categories")
    end
  end
end
