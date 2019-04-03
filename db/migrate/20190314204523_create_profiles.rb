class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :nickname
      t.boolean :is_artist
      t.string :bio
      t.string :location
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
