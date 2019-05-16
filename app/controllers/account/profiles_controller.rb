class Account::ProfilesController < ApplicationController
  layout "dashboard"


  def show
  	@user = resource
  end

  def edit
  	@user = resource
  end

  def update
    @user = current_user
    if current_user.update(user_params)
      sign_in(current_user, :bypass => true)
      redirect_to account_profile_path
    else
      redirect_to edit_account_profile_path
    end
  end

private

  def resource
    resource = current_user.id
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password,
                                 :password_confirmation, :role, :organization_id, :avatar)
  end
end
