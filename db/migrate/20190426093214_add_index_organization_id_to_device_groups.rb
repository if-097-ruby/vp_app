class AddIndexOrganizationIdToDeviceGroups < ActiveRecord::Migration[5.2]
  def change
    add_index :device_groups, :organization_id
  end
end
