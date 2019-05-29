class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string   :first_name
      t.string   :last_name
      t.string   :email
      t.string   :password
      t.integer  :role, default: 1
      t.integer  :organization_id, index: { unique: true }

      t.timestamps
    end
  end
end
