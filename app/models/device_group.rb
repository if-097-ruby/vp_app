class DeviceGroup < ApplicationRecord
  belongs_to :organization
  has_many :devices, as: :deviceable
  validates :name, presence: true, length: { in: 3..20 }
end
