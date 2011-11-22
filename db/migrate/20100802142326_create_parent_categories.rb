class CreateParentCategories < ActiveRecord::Migration
  def self.up
    create_table :parent_categories do |t|
      t.string :category_name
      t.boolean :active_flag

      t.timestamps
    end
  end

  def self.down
    drop_table :parent_categories
  end
end
