class Account::ProfilesController < ApplicationController
  layout "dashboard"

  def show
  end

  def edit
  end

  def update
    @user = current_user
    if current_user.update_attributes(user_params)
      sign_in(current_user, :bypass => true)
      redirect_to account_profile_path
    else
      flash[:error] = "<ul>" + current_user.errors.full_messages.map{|o| "<li>" + o + "</li>" }.join("") + "</ul>"
      render 'edit'
    end
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password,
                                 :password_confirmation, :role, :organization_id, :avatar)
  end
end
