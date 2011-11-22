class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :message
      t.integer :commentator_id
      t.integer :auction_id

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
