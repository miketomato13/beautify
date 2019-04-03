class AddBodyToBiddings < ActiveRecord::Migration[5.2]
  def change
    add_column :biddings, :body, :string
  end
end
