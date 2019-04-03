class AddOfferToBiddings < ActiveRecord::Migration[5.2]
  def change
    add_column :biddings, :offer, :string
  end
end
