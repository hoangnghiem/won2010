class Comment < ActiveRecord::Base
  belongs_to :commentator, :class_name => "User", :foreign_key => "commentator_id"
  belongs_to :auction

  # validate
  validates_presence_of :message
end
