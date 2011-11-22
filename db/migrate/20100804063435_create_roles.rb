class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name
      t.text :description

      t.timestamps
    end

    create_table :admin_roles, :id => false do |t|
      t.references :admin
      t.references :role
    end
  end

  def self.down
    drop_table :roles
    drop_table :admin_roles
  end
end
