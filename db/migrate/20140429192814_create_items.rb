class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :status
      t.integer :course_id
      t.integer :bill_id

      t.timestamps
    end
  end
end
