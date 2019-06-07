class CreatePresentations < ActiveRecord::Migration[5.2]
  def change
    create_table :presentations do |t|
      t.string   :name
      t.string   :attachment
      t.integer  :user_id

      t.timestamps
    end
  end
end
