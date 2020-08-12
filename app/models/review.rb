class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  mount_uploaders :restaurant_image, ImageUploader
  mount_uploaders :food_image, ImageUploader
  mount_uploaders :menu_image, ImageUploader
 
  validates :feedback, presence: true, length: {maximum: 200, minimum: 2}
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}

end
