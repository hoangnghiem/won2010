class CreateAuctions < ActiveRecord::Migration
  def self.up
    create_table :auctions do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.references :item
      t.integer :seller_id
      t.integer :winner_id
      t.integer :current_bid
    end
  end

  def self.down
    drop_table :auctions
  end
end
