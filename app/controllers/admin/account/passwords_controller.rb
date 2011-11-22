#class Admin::Account::PasswordsController < Devise::PasswordsController 
class Admin::Account::PasswordsController < Admin::BaseController
  layout 'admin'

  def update
    admin = Admin.find(params[:admin][:id]) 
    admin.reset_password!(params[:admin][:password], params[:admin][:password_confirmation])
    if admin.errors.empty?
      flash[:success] = "<b>#{admin.username}</b>'s password has been changed."
      redirect_to edit_admin_admin_url(admin)
    else
      flash[:error] = 'Failed to reset password.'
      flash[:error_msgs] = admin.errors.full_messages
      redirect_to edit_admin_admin_url(admin)
    end
  end
end
