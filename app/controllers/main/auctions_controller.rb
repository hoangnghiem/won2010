class Main::AuctionsController < ApplicationController

  layout 'auctions'

  def index
  	@auctions = Auction.where(:state => "opening").includes(:item)
  end
  
  def	show
  	@auction = Auction.includes(:item).find(params[:id])
  	@history = @auction.bids
  	puts @history.size
  	@bid = @auction.bids.new
  	@bid.bidder = current_user
  	@comment = Comment.new
  	@comment.commentator = current_user
  	@comment.auction = @auction
  	puts @history.size
  end
end
