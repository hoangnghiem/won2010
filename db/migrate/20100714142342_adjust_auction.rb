class AdjustAuction < ActiveRecord::Migration
  def self.up
    rename_column :auctions, :current_bid, :current_bid_price
    rename_column :auctions, :max_current_bid, :high_bid_price
    add_column :auctions, :high_bidder_id, :integer
    rename_column :items, :start_bid, :start_bid_price
  end

  def self.down
    rename_column :auctions, :current_bid_price, :current_bid
    rename_column :auctions, :high_bid_price, :max_current_bid
    remove_column :auctions, :high_bidder_id
    rename_column :items, :start_bid_price, :start_bid    
  end
end
