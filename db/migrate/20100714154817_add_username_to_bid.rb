class AddUsernameToBid < ActiveRecord::Migration
  def self.up
    add_column :bids, :bidder_name, :string
  end

  def self.down
    remove_column :bids, :bidder_name
  end
end
