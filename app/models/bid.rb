class Bid < ActiveRecord::Base
  belongs_to :auction
  belongs_to :bidder, :class_name => "User", :foreign_key => "bidder_id"
end
