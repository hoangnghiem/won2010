class AddMaxCurrentBidToAuction < ActiveRecord::Migration
  def self.up
    add_column :auctions, :max_current_bid, :integer
  end

  def self.down
    remove_column :auctions, :max_current_bid
  end
end
