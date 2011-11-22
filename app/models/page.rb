class Page < ActiveRecord::Base
  # relation ship
  has_many :sections, :dependent => :destroy
  accepts_nested_attributes_for :sections, 
                                :reject_if => lambda { |attrs| attrs['content'].blank? },
                                :allow_destroy => true
  # validation
  validates_presence_of :name, :path
  validates_uniqueness_of :name, :path
end
