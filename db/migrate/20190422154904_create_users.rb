class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string   :first_name
      t.string   :last_name
      t.string   :email
      t.string   :password
      t.string   :password_confirmation
      t.integer  :role
      t.integer  :organization_id
      t.timestamps
    end
  end
end