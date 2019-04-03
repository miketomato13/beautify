class AddCityToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :city, :string
  end
end
