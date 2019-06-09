class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:accept_invitation, keys: %i[first_name last_name])
    devise_parameter_sanitizer.permit(:invite, keys: %i[email organization_id])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :terms_of_service, own_organization_attributes: [:name]])
  end

  private

  def require_admin
    unless current_user.admin?
      flash[:error] = 'Sorry, you have to be admin to continue..'
      redirect_to root_path  
    end
  end
end
