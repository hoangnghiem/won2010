class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
      t.string :name
      t.text :content
      t.boolean :active
      t.references :page

      t.timestamps
    end
  end

  def self.down
    drop_table :sections
  end
end
