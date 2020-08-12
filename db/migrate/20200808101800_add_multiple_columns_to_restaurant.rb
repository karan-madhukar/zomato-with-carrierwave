class AddMultipleColumnsToRestaurant < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :restaurant_image, :json
    add_column :restaurants, :food_image, :json
    add_column :restaurants, :menu_image, :json
  end
end
