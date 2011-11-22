class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :referer_id

  # relationship
  has_many :items, :foreign_key => "seller_id"
  has_one :profile
  has_many :bids
  has_many :comments, :foreign_key => "commentator_id"
  has_many :auctions, :foreign_key => "seller_id"
  has_many :watchings

  def display_name
    display_name = username
    display_name = profile.full_name unless profile.blank?
    display_name
  end

  def watching?(auction)
    watching = Watching.where(:user_id => id, :auction_id => auction.id)
    !watching.blank?
  end
end

