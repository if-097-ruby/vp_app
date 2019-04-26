class AddReferenceOrganizationIdToDeviceGroup < ActiveRecord::Migration[5.2]
  def change
    add_reference :device_groups, :organizations, foreign_key: true

  end
end
