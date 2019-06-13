class DeviceGroup < ApplicationRecord
  belongs_to :organization
  has_and_belongs_to_many :devices, optional: true
  validates :name, presence: true, length: { in: 3..20 }
end
