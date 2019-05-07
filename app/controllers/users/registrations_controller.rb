# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def new
    resource = build_resource
    resource.build_own_organization
    respond_with resource
  end

  def create
    super

    if resource.save
      puts params.inspect
      @organization = Organization.create(name: params[:user][:organization][:name])
      resource.update(organization: @organization)
    end
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
  
=begin
  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :password,
      :password_confirmation, :email, organization_attributes: [:name])
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :password,
      :password_confirmation, :current_password, :email,
      own_organization_attributes: [:name])
  end
=end
end
