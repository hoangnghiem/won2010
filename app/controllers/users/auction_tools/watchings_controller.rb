class Users::AuctionTools::WatchingsController < ApplicationController
  layout 'auction_tool', :only => [:index]
  before_filter :authenticate_user!

  def index
    @watchings = current_user.watchings.includes(:auction)
  end

  def create
    begin
      current_user.watchings.create!({ :auction_id => params[:auction_id]})
    rescue Exception => e
      return render :text => e.message, :status => :unprocessable_entity
    end
    render :nothing => true
  end

  def destroy
    begin
      watching = Watching.where(:user_id => current_user.id, :auction_id => params[:auction_id]).first
      raise 'This watching not found. Something when wrong!' if watching.blank?
      watching.destroy
    rescue Exception => e
      return render :text => e.message, :status => :unprocessable_entity
    end
    render :nothing => true
  end
end

