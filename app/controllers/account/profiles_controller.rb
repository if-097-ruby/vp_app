class Account::ProfilesController < ApplicationController
  layout "dashboard"

  def show
  	@user = current_user.id
  end

  def edit
  	@user = current_user.id
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to account_profile_path, :flash => { :success => "Profile updated." }
    else
      render 'edit'
    end
  end

end
