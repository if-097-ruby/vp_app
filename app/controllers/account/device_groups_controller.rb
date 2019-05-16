class Account::DeviceGroupsController < ApplicationController
  layout "dashboard"

  def index
    @device_group = DeviceGroup.all
  end

  def new
    @device_group = DeviceGroup.new
  end

  def show
    @device_group = resource
  end

  def create
    @device_group = DeviceGroup.create(device_group_params)

    if @device_group.save
      flash[:notice] = 'Group added!'
      redirect_to account_device_groups_path
    else
      flash[:error] = 'Failed to create a group!'
      render :new
    end

  end

  def edit
    @device_group = resource
  end

  def update
    if @device_group.update(device_group_params)
      redirect_to account_device_groups_path
    else
      render :edit
    end
  end

  def destroy
    @device_group = resource

    if @device_group.delete
      flash[:notice] = 'Product deleted!'
      redirect_to account_device_groups_path
    else
      flash[:error] = 'Failed to delete this product!'
      render :destroy
    end
  end

  private

  def device_group_params
    params.require(:device_group).permit(:name)
  end

  def resource
    DeviceGroup.find(params[:id])
  end
end