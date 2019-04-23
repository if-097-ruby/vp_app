class DeviceController < ApplicationController

def index
  @devices = Device.all
end

def show
  @device = Device.find(params[:id])
end

def create
  @device = Device.create(device_params)

  redirect_to device_path
end

def new
  @device = Device.new
end

def edit
  @device = User.find(params[:id])
end

def destroy
  @device = User.find(params[:id])
  @device.destroy

  redirect_to device_path
end

private

  def device_params
    params.require(:device).permit(:name, :device_type, :device_group_id)
  end

end