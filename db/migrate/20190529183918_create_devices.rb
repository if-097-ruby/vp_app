class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :device_type
      t.references :organization, index: true

      t.timestamps
    end

    create_table :device_groups_devices, id: false do |t|
      t.belongs_to :device_group, index: true
      t.belongs_to :device, index: true
    end
  end
end
