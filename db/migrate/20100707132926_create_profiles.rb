class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string :full_name
      t.string :location
      t.string :gender
      t.string :phone_number
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
