class CreateSlides < ActiveRecord::Migration[5.2]
  def change
    create_table :slides do |t|
      t.string      :image
      t.references  :presentation

      t.timestamps
    end
  end
end
