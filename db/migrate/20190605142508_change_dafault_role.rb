class ChangeDafaultRole < ActiveRecord::Migration[5.2]
  def change
  	change_column_default(:users, :role, from: 0, to: 1)
  end
end
