class Account::UsersController < Account::ApplicationController

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
    @user = User.new(user_params)
    if @user.save
      redirect_to account_user_path(id: @user.id)
    else
      render :new
    end
  end

  def edit
    @user = resource
  end

  def update
    @user = resource
    if @user.update_attributes(user_params)
      redirect_to account_user_path(id: @user.id)
    else
      render 'edit'
    end
  end

  def destroy
    @user = resource
    @user.destroy

    redirect_to account_users_path
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
