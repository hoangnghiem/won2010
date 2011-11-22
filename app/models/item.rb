class Item < ActiveRecord::Base
  belongs_to :seller, :class_name => "User", :foreign_key => "seller_id"
  belongs_to :category, :class_name => "Category", :foreign_key => "category_id"
  has_many :auctions, :dependent => :destroy, :order => 'start_date DESC'
  has_many :photos, :dependent => :destroy
  accepts_nested_attributes_for :photos, 
                                :reject_if => lambda { |attrs| attrs['data'].blank? },
                                :allow_destroy => true
  validates_presence_of :title, :description, :start_bid_price                              
  
  def current_auction
    auctions.first
  end
  
  after_update :update_auction_period
  def update_auction_period
    current_auction.update_attribute(:end_date, Time.parse(current_auction.start_date.to_s) + bid_period.day) 
  end
end
