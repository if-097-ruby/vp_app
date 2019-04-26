class AddReferenceOrganizationIdToDeviceGroup < ActiveRecord::Migration[5.2]
  def change
    add_reference :device_groups, :organization, foreign_key: true

  end
end
