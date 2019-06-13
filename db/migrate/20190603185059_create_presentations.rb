class CreatePresentations < ActiveRecord::Migration[5.2]
  def change
    create_table :presentations do |t|
      t.string      :name
      t.string      :attachment
      t.references (:user)

      t.timestamps
    end
  end
end