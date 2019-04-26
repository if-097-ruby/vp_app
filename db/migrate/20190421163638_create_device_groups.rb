class CreateDeviceGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :device_groups do |t|
      t.string   :name

      t.timestamps
    end
  end
end
