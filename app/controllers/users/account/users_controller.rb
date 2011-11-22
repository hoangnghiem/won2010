class Users::Account::UsersController < ApplicationController
  layout 'auction_tool'
  before_filter :authenticate_user!
	
  def edit
    @user = current_user
    @user.build_profile if @user.profile.blank? 
  end
	
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully update..."
      redirect_to edit_user_url(@user)
    else
      flash[:notice] = "Failed"
      redirect_to edit_user_url(@user)
    end
  end
end
