class Admin::RolesController < Admin::BaseController
  layout 'admin'
  load_and_authorize_resource 

  def index
    @roles = Role.includes(:permissions).reject { |r| r.name == Role::SUPER_ADMIN }
  end

  def new
    @role = Role.new
  end
  
  def edit
    @role = Role.includes(:permissions).find(params[:id])
  end

  def create
    @role= Role.new(params[:role])
    if @role.save
      flash[:success] = "Role <b>#{@role.name}</b> successfully created."
      redirect_to(admin_roles_url)
    else
      flash[:error] = "#{@role.errors.count} error prohibited this role from being saved:"
      flash[:error_msgs] = @role.errors.full_messages
      render :action => :new
    end
  end

  def update
    @role = Role.find(params[:id])
    if @role.update_attributes(params[:role])
      flash[:success] = "Role <b>#{@role.name}</b> was successfully updated."
      redirect_to admin_roles_url
    else
      render :action => :edit
    end
  end
  
  def destroy
    @role = Role.find(params[:id])
    @role.destroy
    flash[:success] = "Role <b>#{@role.name}</b> successfully deleted."
    redirect_to admin_roles_url
  end

  protected
  def set_title
    @title = "Admin Roles"
  end

  def current_tab
    @current_tab = "user-management", "admin-roles"
  end

end
