class AddMultipleColumnToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :restaurant_image, :json
    add_column :reviews, :food_image, :json
    add_column :reviews, :menu_image, :json
  end
end
