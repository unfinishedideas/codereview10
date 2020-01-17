class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :cost, presence: true
  validates :country_of_origin, presence: true
  validates_length_of :name, maximum: 100
  validates_length_of :country_of_origin, minimum: 3
  validates_numericality_of :cost, only_integer: true

  before_save(:titleize_product)

  private
  def titleize_product
    self.name = self.name.titleize
  end
end
