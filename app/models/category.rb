class Category < ActiveRecord::Base

  validates_presence_of :category_name

  belongs_to :parent_category, :class_name => "ParentCategory", :foreign_key => "parent_category_id"
  has_many :items
  
end
