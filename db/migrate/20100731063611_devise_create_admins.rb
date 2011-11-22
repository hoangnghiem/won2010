class DeviseCreateAdmins < ActiveRecord::Migration
  def self.up
    create_table(:admins) do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.database_authenticatable :null => false
      t.recoverable
      t.lockable
      t.trackable
      t.timestamps
    end
    add_index :admins, :username, :unique => true
  end

  def self.down
    drop_table :admins
  end
end
