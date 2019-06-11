class RemoveColumnDevices < ActiveRecord::Migration[5.2]
  def change
    remove_column :devices, :device_group_id
  end
end
