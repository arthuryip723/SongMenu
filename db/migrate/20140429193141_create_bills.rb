class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.integer :status
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
