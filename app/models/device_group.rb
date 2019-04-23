class DeviceGroup < ApplicationRecord
	validates :name, :organization_id, presence: true
	validates :name, length: { in: 3..40 }
	has_many :devices, dependent: :destroy
end
