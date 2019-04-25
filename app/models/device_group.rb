class DeviceGroup < ApplicationRecord
	has_many :devices, dependent: :destroy
  belongs_to :organization
	validates :name, :organization_id, presence: true
	validates :name, length: { in: 3..40 }
	
end
