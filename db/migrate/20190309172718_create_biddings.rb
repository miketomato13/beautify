 class CreateBiddings < ActiveRecord::Migration[5.2]
  def change
    create_table :biddings do |t|
      t.references :user, foreign_key: true
      t.references :listing, foreign_key: true
      t.boolean :apprv_deny

      t.timestamps
    end
  end
end
