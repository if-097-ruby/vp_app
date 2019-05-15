class AddOwnerIdToOrganizations < ActiveRecord::Migration[5.2]
  def change
    add_reference :organizations, :owner
  end
end
