class ParentCategory < ActiveRecord::Base
  validates_presence_of :category_name

  has_many :categories, :dependent => :destroy

end
