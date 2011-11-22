class Admin::DashboardController < Admin::BaseController
  layout 'admin'
  before_filter :authenticate_admin!

  def index
    authorize! :read, :dashboard 
  end
  
  protected
  def set_title
    @title = "Dashboard"
  end

  def current_tab
    @current_tab = "dashboard"
  end
end
