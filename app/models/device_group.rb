class DeviceGroup < ApplicationRecord
	has_many :devices, dependent: :destroy
	validates :name, :organization_id, presence: true
	validates :name, length: { in: 3..40 }
	
end
