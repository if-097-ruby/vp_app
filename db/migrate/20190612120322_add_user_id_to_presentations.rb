class AddUserIdToPresentations < ActiveRecord::Migration[5.2]
  def change
  	add_reference :presentations, :user, index: true
  end
end
