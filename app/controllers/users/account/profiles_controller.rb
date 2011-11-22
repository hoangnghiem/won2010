class Users::Account::ProfilesController < ApplicationController
  layout 'auction_tool'
  before_filter :authenticate_user!
  
  def index
    if current_user.profile.blank?
      @profile = current_user.build_profile
    else
      @profile = current_user.profile
    end
  end
  
  def create
    @profile = Profile.new(params[:profile])
    if @profile.save
      redirect_to(profiles_path, :notice => 'Profile was successfully updated.')
    else
      render :action => "index"
    end
  end
  
  def update
    @profile = Profile.find(params[:profile][:id])    
    if @profile.update_attributes(params[:profile])
      redirect_to(profiles_path, :notice => 'Profile was successfully updated.')
    else
      render :action => "index"      
    end
  end
end

