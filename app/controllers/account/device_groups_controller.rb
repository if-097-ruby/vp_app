class Account::DeviceGroupsController < Account::DashboardController
  before_action :is_admin?
  
  def index
    @device_groups = collection
  end

  def new
    @device_group = DeviceGroup.new
  end

  def create
    @device_group = parent.device_groups.build(device_group_params)
    if @device_group.save
      flash.now[:notice] = 'Group saved!'
      redirect_to account_device_groups_path
    else
      flash.now[:error] = 'Failed to create a group!'
      render :new
    end
  end

  def edit
    @device_group = resource
  end

  def update
    @device_group = resource
    if @device_group.update(device_group_params)
      flash.now[:notice] = 'Group updated!'
      redirect_to account_device_groups_path
    else
      flash.now[:error] = 'Failed to update group!'
      render :edit
    end
  end

  def destroy
    @device_group = resource

    if @device_group.delete
      flash.now[:notice] = 'Group deleted!'
    else
      flash.now[:error] = 'Failed to delete this group!'
    end
    redirect_to account_device_groups_path
  end

  private

  def parent
    current_user.own_organization
  end

  def collection
    parent.device_groups
  end

  def device_group_params
    params.require(:device_group).permit(:name)
  end

  def resource
    parent.device_groups.find(params[:id])
  end

   private

  def is_admin?
    redirect_to root_path unless current_user.role == 'admin'
  end
end
