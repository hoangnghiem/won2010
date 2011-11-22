class Admin::AdminsController < Admin::BaseController
  layout 'admin'
  load_and_authorize_resource 

  def index
    @admins = Admin.includes(:roles).reject { |a| a == current_admin || a.flatten_roles.include?(Role::SUPER_ADMIN) }
  end

  def new
    @admin = Admin.new
  end
  
  def edit
    @admin = Admin.find(params[:id])
  end

  def create
    @admin = Admin.new(params[:admin])
    if @admin.save
      flash[:success] = "Admin <b>#{@admin.username}</b> successfully created."
      redirect_to(admin_admins_url)
    else
      flash[:error] = "#{@admin.errors.count} error prohibited this user from being saved:"
      flash[:error_msgs] = @admin.errors.full_messages
      render :action => :new
    end
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update_attributes(params[:admin])
      if params[:s] == "1"
        flash[:success] = "Your information was successfully updated."
        redirect_to admin_root_path_url
      else
        flash[:success] = "Admin <b>#{@admin.username}</b> was successfully updated."
        redirect_to admin_admins_url
      end
    else
      render :action => :edit
    end
  end
  
  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy
    flash[:success] = "Admin <b>#{@admin.username}</b> successfully deleted."
    redirect_to admin_admins_url
  end

  protected
  def set_title
    @title = "Admin Users"
  end

  def current_tab
    @current_tab = "user-management", "admin-users"
  end
end
