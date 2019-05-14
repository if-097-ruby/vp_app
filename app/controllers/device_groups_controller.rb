class DeviceGroupsController < ApplicationController

  before_action :find_device_group, only: [:edit, :update, :show, :destroy]

  def new
    @device_groups = DeviceGroup.new
  end

  def create
    @device_groups = DeviceGroup.new(device_group_params)

    if @device_groups.save
      redirect_to device_groups_path
    else
      render :new
    end
  end

  def index
    @device_groups = DeviceGroup.all
  end

  def edit
  end

  def update
    if @device_groups.update(device_group_params)
      redirect_to device_groups_path
    else
      render :edit
    end
  end

  def destroy
    if @device_groups.destroy
      redirect_to device_groups_path
    else
      redirect_to device_groups_path, error: "Device group wasn't deleted."
    end
  end

  private
    def device_group_params
      params.require(:device_group).permit(:name)
    end

    def find_device_group
      @device_groups = DeviceGroup.find(params[:id])
    end
end