class AddTitleToBiddings < ActiveRecord::Migration[5.2]
  def change
    add_column :biddings, :title, :string
  end
end
