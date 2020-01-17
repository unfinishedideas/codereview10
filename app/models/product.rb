class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :cost, presence: true
  validates :country_of_origin, presence: true
  validates_length_of :name, maximum: 100
  validates_length_of :country_of_origin, minimum: 3
  validates_numericality_of :cost, only_integer: true

  scope :most_recent, -> { order(created_at: :desc).limit(3)}

  scope :most_reviews, -> {(
    select("products.id, products.name, products.cost, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(10)
    )}

    scope :from_usa, -> { where(country_of_origin: "USA") }

    before_save(:titleize_product)

    private
    def titleize_product
      self.name = self.name.titleize
    end
  end
