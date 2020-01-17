class Review < ApplicationRecord
  belongs_to :product

  validates :author, presence: true
  validates :rating, presence: true
  validates :content_body, presence: true
  validates_length_of :author, maximum: 100
  validates_numericality_of :rating, only_integer: true
  validates_numericality_of :rating, less_than_or_equal_to: 5

  # before_save(:capitalize_name)
  #
  # private
  # def capitalize_name
  #   self.author = self.author.capitalize
  # end
end


# include ActiveModel::Model
#        attr_accessor :number_of_cars
#
#        validates_numericality_of :number_of_cars, less_than: 2
#      end
#
#      # RSpec
#      RSpec.describe Person, type: :model do
#        it do
#          should validate_numericality_of(:number_of_cars).
#            is_less_than(2)
#        end
#      end
#
#      # Minitest (Shoulda)
#      class PersonTest < ActiveSupport::TestCase
#        should validate_numericality_of(:number_of_cars).
#          is_less_than(2)
#      end
