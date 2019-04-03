class AddTagsToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :tags, :string
  end
end
