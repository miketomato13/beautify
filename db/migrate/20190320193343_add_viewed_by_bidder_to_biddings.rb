class AddViewedByBidderToBiddings < ActiveRecord::Migration[5.2]
  def change
    add_column :biddings, :viewed_by_bidder, :boolean, null: false, default: false
  end
end
