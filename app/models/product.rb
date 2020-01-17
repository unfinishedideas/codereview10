class Product < ApplicationRecord
    has_many :reviews, dependent: :destroy
    
    validates :name, presence: true
    validates :cost, presence: true
    validates :country_of_origin, presence: true
    validates_length_of :name, maximum: 100
    validates_length_of :country_of_origin, maximum: 3
    validates_numericality_of :cost, only_integer: true
end
