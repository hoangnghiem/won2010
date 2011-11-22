class Main::CommentsController < ApplicationController
  def	create
    comment = Comment.new(params[:comment])
    if comment.save
      redirect_to auction_path(:id => comment.auction_id), :notice => 'You have added comment to this auction'
    else
      redirect_to auction_path(:id => comment.auction_id), :notice => 'Cannot save the comment'
    end
  end 
end
