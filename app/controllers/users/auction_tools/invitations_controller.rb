class Users::AuctionTools::InvitationsController < ApplicationController
  layout 'auction_tool'
  before_filter :authenticate_user!
  
  def new
    @invitation = Invitation.new('', '')
  end
  
  def create
    @invitation = Invitation.new(params[:invitation][:recipients],
                                 params[:invitation][:message])
    if @invitation.valid?
      Delayed::Job.enqueue InviteJob.new(current_user.email, 
                                        @invitation.recipients, 
                                        @invitation.message, 
                                        current_user.id, 
                                        current_user.username)
      return redirect_to new_invitation_path, :notice => 'Your invitation has been sent.'
    end
    render :action => :new
  end
  
  def fetch_contacts
    email = params[:email] << '@' << params[:target]
    token = ContactsFetcher::Gmail.authenticate(email, params[:password])
    if token.nil?
      return render :text => 'invalid'
    end
    emails = ContactsFetcher::Gmail.fetch(token, email)
    render :partial => 'contacts', :locals => {:emails => emails}
  end
end
