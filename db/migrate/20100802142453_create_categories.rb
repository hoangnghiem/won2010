class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :category_name
      t.boolean :active_flag
      t.integer :parent_category_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end
