class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_account_update_params, only: :update

  # GET /resource/sign_up
  def new
    resource = build_resource
    resource.build_own_organization

    respond_with resource
  end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name,
  #                                                      :terms_of_service, own_organization_attributes: [:name]])
  #   devise_parameter_sanitizer.permit(:accept_invitation, keys: [:first_name, :last_name])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: %i[attribute avatar])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end
end
