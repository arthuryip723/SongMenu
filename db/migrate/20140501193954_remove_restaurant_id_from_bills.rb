class RemoveRestaurantIdFromBills < ActiveRecord::Migration
  def change
    remove_column :bills, :restaurant_id, :integer
  end
end
