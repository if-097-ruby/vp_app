class AddDeviceOrganizationId < ActiveRecord::Migration[5.2]
  def change
    add_reference :devices, :organization, foreign_key: true
  end
end
