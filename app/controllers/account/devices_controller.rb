class Account::DevicesController < Account::DashboardController
  def index
    @devices = collection    
  end

  def new
    @device = Device.new
  end

  def create
    @device = parent.devices.build(device_params)
    if @device.save
      flash.now[:notice] = 'Device saved!'
      redirect_to account_devices_path
    else
      flash.now[:error] = 'Failed to create a device!'
      render :new
    end
  end

  def edit
    @device = resource
  end

  def update
    @device = resource
    if @device.update(device_params)
      flash.now[:notice] = 'Device updated!'
      redirect_to account_devices_path
    else
      flash.now[:error] = 'Failed to update device!'
      render :edit
    end
  end

  def destroy
    @device = resource

    if @device.delete
      flash.now[:notice] = 'Device deleted!'
    else
      flash.now[:error] = 'Failed to delete this device!'
    end
    redirect_to account_devices_path
  end

  private

  def parent
    current_user.own_organization
  end

  def collection
    parent.devices
  end

  def device_params
    params.require(:device).permit(:name, :device_type)
  end

  def resource
    parent.devices.find(params[:id])
  end
end
