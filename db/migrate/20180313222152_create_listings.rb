class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :title
      t.references :user, foreign_key: true
      t.string :description
      t.string :address
      t.integer :length
      t.integer :height
      t.date :due_date
      t.string :budget

      t.timestamps
    end
  end
end
