class DeviceGroupController < ApplicationController

def index
  @devicesgroup = DeviceGroup.all
end

def show
  @devicegroup = DeviceGroup.find(params[:id])
end

def create
  @devicegroup = DeviceGroup.create(devicegroup_params)

  redirect_to devicegroup_path
end

def new
  @devicegroup = DeviceGroup.new
end

def edit
  @devicegroup = DeviceGroup.find(params[:id])
end

def destroy
  @devicegroup = User.find(params[:id])
  @devicegroup.destroy

  redirect_to devicegroup_path
end

private

  def devicegroup_params
    params.require(:devicegroup).permit(:name, :organization_id)
  end

end