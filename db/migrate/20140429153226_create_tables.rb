class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.integer :no

      t.timestamps
    end
  end
end
