class Account::DeviceGroupsController < ApplicationController

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
      redirect_to account_device_groups_path
    else
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

    if @device_group.destroy
      redirect_to account_device_groups_path
    else
      redirect_to account_device_groups_path, error: "Device group wasn't deleted."
    end
    @device_group = resource
    @device_group.destroy

    redirect_to account_device_groups_path
  end

  private

  def device_group_params
    params.require(:device_groups).permit(:name)
  end

  def resource
    DeviceGroup.find(params[:id])
  end
end