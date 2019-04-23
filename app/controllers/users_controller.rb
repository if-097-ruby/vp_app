class UsersController < ApplicationController
  
  def index
  	@user = collection
  end

  def show
  	@user = resourse
  end

  def create
    user = User.create(user_params)

    redirect_to users_path
  end

  def parent
    current_user
  end

  def collection
    parent.users
  end

  def resource
    collection.find(params[:id])
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
