class DeviceGroupsController < ApplicationController

  def index
    @device_group = DeviceGroup.all
  end

  def new
    @device_group = DeviceGroup.new
  end

  def show
    find_device_group
  end

  def create
    @device_group = DeviceGroup.create(device_group_params)

    if @device_group.save
      redirect_to device_groups_path
    else
      render :new
    end
  end

  def edit
    find_device_group
  end

  def update
    if @device_group.update(device_group_params)
      redirect_to device_groups_path
    else
      render :edit
    end
  end

  def destroy
    find_device_group
    @device_group.destroy

    redirect_to device_groups_path
  end

  private

  def device_group_params
    params.require(:device_group).permit(:name)
  end

  def find_device_group
    @device_group = DeviceGroup.find(params[:id])
  end
end