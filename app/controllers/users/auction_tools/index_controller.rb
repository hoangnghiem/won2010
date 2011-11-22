class Users::AuctionTools::IndexController < ApplicationController
  layout 'auction_tool'
  before_filter :authenticate_user!
    
  def index
  end
end
