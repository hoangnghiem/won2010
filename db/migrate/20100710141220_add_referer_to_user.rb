class AddRefererToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :referer_id, :integer
  end

  def self.down
    remove_column :users, :referer_id
  end
end
