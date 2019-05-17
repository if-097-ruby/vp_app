class Account::DeviceGroupsController < ApplicationController
  layout "dashboard"

  def index
    @device_group = DeviceGroup.all
  end

  def new
    @device_group = DeviceGroup.new
  end

  def show
    @device_group = resource_group
  end

  def create
    @organization = Organization.find_by owner_id: current_user.id
    @device_group = DeviceGroup.new(device_group_params)
    @device_group.organization_id = @organization[:id]
    @device_group.save

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
end