class Account::ProfilesController < ApplicationController
  layout 'dashboard'

  def show; end

  def edit; end

  def update
    @user = current_user
    if current_user.update(user_params)
      sign_in(current_user, bypass: true)
      redirect_to account_profile_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password,
                                 :password_confirmation, :role, :organization_id, :avatar)
  end
end
