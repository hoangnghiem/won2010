class Auction < ActiveRecord::Base
  belongs_to :item
  has_many :bids, :order => 'price DESC'
  belongs_to :seller, :class_name => "User", :foreign_key => "seller_id"
  belongs_to :winner, :class_name => "User", :foreign_key => "winner_id"
  belongs_to :high_bidder, :class_name => "User", :foreign_key => "high_bidder_id"
  has_many :comments
    
  def current_bid
    current_bid_price.blank? ? item.start_bid_price : current_bid_price
  end

  def high_bid
    high_bid_price.blank? ? current_bid : high_bid_price
  end
end
