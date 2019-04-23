class RenameOrganisationIdToOrganizationId < ActiveRecord::Migration[5.2]
  def change
  	rename_column :device_groups, :organisation_id, :organization_id
  end
end
