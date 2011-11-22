class AddStateToAuction < ActiveRecord::Migration
  def self.up
    add_column :auctions, :state, :string
  end

  def self.down
    remove_column :auctions, :state
  end
end
