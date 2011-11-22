class CreatePermissions < ActiveRecord::Migration
  def self.up
    create_table :permissions do |t|
      t.string :action
      t.string :object_type
      t.string :name
      t.boolean :non_model
      t.timestamps
    end

    create_table :role_permissions, :id => false do |t|
      t.references :role
      t.references :permission
    end
  end

  def self.down
    drop_table :permissions
    drop_table :role_permissions
  end
end
