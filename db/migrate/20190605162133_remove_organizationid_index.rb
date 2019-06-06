class RemoveOrganizationidIndex < ActiveRecord::Migration[5.2]
  def change
    remove_index 'organization_id', name: 'index_users_on_organization_id'
  end
end
