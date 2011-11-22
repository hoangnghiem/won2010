class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :title
      t.string :location
      t.text :description
      t.integer :start_bid
      t.integer :bid_period
      t.integer :seller_id
      t.integer :category_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
