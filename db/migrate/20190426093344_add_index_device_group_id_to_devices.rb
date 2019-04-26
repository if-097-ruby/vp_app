class AddIndexDeviceGroupIdToDevices < ActiveRecord::Migration[5.2]
  def change
    add_index :devices, :device_group_id
  end
end
