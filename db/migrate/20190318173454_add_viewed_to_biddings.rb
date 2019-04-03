class AddViewedToBiddings < ActiveRecord::Migration[5.2]
  def change
    add_column :biddings, :viewed, :boolean, null: false, default: false
  end
end
