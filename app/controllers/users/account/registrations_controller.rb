class Users::Account::RegistrationsController < Devise::RegistrationsController
  before_filter :store_referer, :only => [:new]
  
  def new
    if session[:referer_id]
      build_resource({:referer_id => session[:referer_id]})
    else
      build_resource({})
    end
    render_with_scope :new   
  end
  
  def create
    build_resource
    
    if resource.save
      session.delete :referer_id
      set_flash_message :notice, :signed_up
#      sign_in_and_redirect(resource_name, resource)
      redirect_to :action => 'last_step'
    else
      clean_up_passwords(resource)
      render_with_scope :new
    end
  end
  
  def last_step

  end
  
  private
  def store_referer
    if params[:referer_id]
      session[:referer_id] = params[:referer_id]
      redirect_to new_user_registration_path
    end
  end
end
