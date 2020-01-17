class Review < ApplicationRecord
  belongs_to :product

  validates :author, presence: true
  validates :rating, presence: true
  validates :content_body, presence: true
  validates_length_of :author, maximum: 100
  validates_numericality_of :rating, only_integer: true
end