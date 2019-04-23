class UsersController < ApplicationController
  
  def index
  	@user = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
    @user = User.create(user_params)

    redirect_to users_path
  end

  def new
  	@user = User.new
  end

  def edit
  	@user = User.find(params[:id])
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, 
    	                           :password_confirmation, :admin, :organisation_id)
  end
  
end
