class CreateCompletedContents < ActiveRecord::Migration
  def change
    create_table :completed_contents do |t|
      t.belongs_to :content
      t.belongs_to :student
      t.datetime :completed_date

      t.timestamps null: false
    end
  end
end
