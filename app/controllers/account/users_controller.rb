module Account

  class UsersController < ApplicationController
   
    def index
     @users = collection
    end

    def show
      @user = resource
    end

    def new
      @user = User.new
    end

    def create
      user = User.create(user_params)

      redirect_to user_path(user)
    end

    def edit
      @user = resource
    end

    def update
      @user = resource

      @user.update(user_params)

      redirect_to user_path(@user)
    end

    def destroy
      @user = resource
      @user.destroy

      redirect_to user_path
    end

  private

    def collection
      User.all  
    end

    def resource
      User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, 
      	                           :password_confirmation, :role, :organization_id)
    end

  end

end