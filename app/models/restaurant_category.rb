class RestaurantCategory < ApplicationRecord
  VALID_NAME_REGEX = /\A[\sA-Za-z]*\z/i
  
  has_many :restaurants
  validates :name, presence: true, length: { maximum: 35, minimum:2 }, format: {with: VALID_NAME_REGEX }
end
