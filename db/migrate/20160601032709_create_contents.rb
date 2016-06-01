class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :name
      t.integer :lesson_id

      t.timestamps null: false
    end
  end
end
