class Main::BidsController < ApplicationController
  
  def	create
    bid = Bid.new(params[:bid])
    auction = Auction.find(bid.auction_id)
    
    if bid.price.blank?
      return redirect_to auction_path(auction), :notice => "Please enter a valid bid."
    end

    # validate bid
    if bid.price <= auction.current_bid
      return redirect_to auction_path(auction), :notice => "You must bid greater than #{auction.current_bid}"
    end
    
    if bid.price <= auction.high_bid
      auction.current_bid_price = bid.price + BidIncrement.get_increment(auction.current_bid)
      auction.current_bid_price = auction.high_bid if auction.current_bid_price > auction.high_bid
      auction.save!
      return redirect_to auction_path(auction), :notice => "Your bid is less than high bidder #{auction.high_bidder.username}, please place another price."
    end
    
    outbid_bidder = auction.high_bidder
    auction.current_bid_price = auction.high_bid + BidIncrement.get_increment(auction.current_bid)
    auction.high_bid_price = bid.price
    auction.high_bidder = current_user
    bid.bidder_name = current_user.username
    auction.bids << bid
    auction.save!
    # TODO: notify outbid here!
    logger.info "#{outbid_bidder.username} has been outbid"

    redirect_to auction_path(auction), :notice => 'You have successfully placed bid on this auction'
  end 
  
end
