class Review < ApplicationRecord
  belongs_to :product

  validates :author, presence: true
  validates :rating, presence: true
  validates :content_body, presence: true
  validates_length_of :author, in: 5..50
  validates_length_of :content_body, in: 50..250
  validates_numericality_of :rating, only_integer: true
  validates_numericality_of :rating, less_than_or_equal_to: 5

  # before_save(:capitalize_name)
  #
  # private
  # def capitalize_name
  #   self.author = self.author.capitalize
  # end
end
