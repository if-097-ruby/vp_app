class UsersController < ApplicationController

  before_action :current_user, only: [:show, :edit, :update, :destroy]

  def index
  	@user = User.all
  end

  def show
  	
  end

  def create
    user = User.create(user_params)

    redirect_to users_path
  end

  def new
  	@user = User.new
  end

  def edit
  	
  end


  def destroy

    redirect_to users_path
  end

    private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, 
    	                         :password_confirmation, :admin, :organisation_id)
  end
  
  def currest_user
    @user = User.find(params[:id])
  end  
  
end
