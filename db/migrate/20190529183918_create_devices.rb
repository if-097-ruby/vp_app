class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :device_type
      t.references :deviceable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
