class Admin::UsersController < Admin::BaseController
  layout 'admin'
  load_and_authorize_resource 

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "User <b>#{@user.username}</b> successfully created."
      redirect_to(admin_users_url)
    else
      flash[:error] = "#{@user.errors.count} error prohibited this user from being saved:"
      flash[:error_msgs] = @user.errors.full_messages
      render :action => :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "User <b>#{@user.username}</b> was successfully updated."
      redirect_to admin_users_url
    else
      render :action => :edit
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User <b>#{@user.username}</b> successfully deleted."
    redirect_to admin_users_url
  end

  protected
  def set_title
    @title = "Website Users "
  end

  def current_tab
    @current_tab = "user-management", "website-users"
  end
end
