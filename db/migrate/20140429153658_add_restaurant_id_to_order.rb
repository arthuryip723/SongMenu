class AddRestaurantIdToOrder < ActiveRecord::Migration
  def change
    add_column :tables, :restaurant_id, :integer
  end
end
