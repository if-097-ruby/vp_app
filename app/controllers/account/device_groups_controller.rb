class Account::DeviceGroupsController < Account::DashboardController
  def index
    @device_group = collection
  end

  def new
    @device_group = DeviceGroup.new
  end

  def create
    @device_group = parent.device_groups.build(device_group_params)
    if @device_group.save
      redirect_to account_device_groups_path
    else
      flash[:error] = 'Failed to create a group!'
      render :new
    end
  end

  def edit
    @device_group = resource_group
  end

  def update
    @device_group = resource_group
    if @device_group.update(device_group_params)
      redirect_to account_device_groups_path
    else
      render :edit
    end
  end

  def destroy
    @device_group = resource_group

    if @device_group.delete
      flash[:notice] = 'Group deleted!'
      redirect_to account_device_groups_path
    else
      flash[:error] = 'Failed to delete this group!'
      render :destroy
    end
  end

  private

  def device_group_params
    params.require(:device_group).permit(:name)
  end

  def resource_group
    DeviceGroup.find(params[:id])
  end

  def collection
    DeviceGroup.all
  end

  def parent
    @organization = Organization.find_by(current_user.organization)
  end
end