class Account::DeviceGroupsController < Account::DashboardController
  def index
    @device_groups = collection
  end

  def new
    @device_group = DeviceGroup.new
  end

  def create
    @device_group = parent.device_groups.build(device_group_params)
    if @device_group.save
      flash[:notice] = 'Group saved!'
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
      flash[:notice] = 'Group updated!'
      redirect_to account_device_groups_path
    else
      flash[:error] = 'Failed to update group!'
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
    end
  end

  private

  def parent
    current_user.own_organization
  end

  def collection
    parent.device_groups.all
  end

  def device_group_params
    params.require(:device_group).permit(:name)
  end

  def resource_group
    parent.device_groups.find(params[:id])
  end
end
