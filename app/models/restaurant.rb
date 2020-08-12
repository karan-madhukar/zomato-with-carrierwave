class Restaurant < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  VALID_PHONE_REGEX = /\A[6-9][0-9]{9}\z/
  VALID_NAME_REGEX = /\A[\sA-Za-z]*\z/i
  VALID_EMAIL_REGEX = 	/\A[^@\s]+@([^@.\s]+\.)*[^@.\s]+\z/
  
  geocoded_by :address
   
  after_validation :geocode
  after_save :reindex
    
  mount_uploader :image, ImageUploader
  mount_uploaders :restaurant_image, ImageUploader
  mount_uploaders :food_image, ImageUploader
  mount_uploaders :menu_image, ImageUploader
    
  belongs_to :restaurant_category
  has_many :food_items, dependent: :destroy
  has_many :book_tables
  has_many :reviews, dependent: :destroy
    
  validates :address, presence: true, length: { maximum: 200, minimum: 5}
  validates :phone_no, presence: true, format: { with: VALID_PHONE_REGEX }
  validates :table_price, presence: true,  numericality: { greater_than_or_equal_to: 1 }
  validates :restaurant_name, presence: true, format: { with:  VALID_NAME_REGEX }, length: { maximum: 50, minimum: 2}
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { :case_sensitive => false}, length: { maximum: 80, minimum: 8 }
  
  settings do
    mappings dynamic: false do
      indexes :restaurant_name, type: :text, analyzer: :english
      indexes :address, type: :text, analyzer: :english
      indexes :restaurant_category do
        indexes :name, type: "text", analyzer: :english
      end
      indexes :food_items do
        indexes :name, type: "text", analyzer: :english
      end
    end
  end

  def as_indexed_json(options = {})
    self.as_json(
      options.merge(only: [:restaurant_name, :address],
        include: {
          restaurant_category: {only: :name},
          food_items: {only: :name},
        }
      )
    )
  end
  
  def reindex
   __elasticsearch__.index_document
  end

end
