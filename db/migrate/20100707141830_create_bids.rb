class CreateBids < ActiveRecord::Migration
  def self.up
    create_table :bids do |t|
      t.integer :price
      t.references :auction
      t.integer :bidder_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bids
  end
end
