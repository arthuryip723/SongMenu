class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.float :price
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
