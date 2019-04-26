class Account::UsersController < Account::AccountController
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
    if @user.save
      redirect_to user_path(user)
    else

    end
  end

  def create
    @user = organization.users.build(user_params)
    redirect_to user_path(user)
  end

  def edit
    user_by_id
  end

  def update
    user_by_id

    @user.update(user_params)

    redirect_to user_path(@user)
  end

  def destroy
    user_by_id
    @user.destroy

    redirect_to user_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, 
                                  :password_confirmation, :role, :organization_id)
  end
  def user_by_id
    @user = User.find(params[:id])
  end
end
