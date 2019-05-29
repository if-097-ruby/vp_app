class DeviceGroup < ApplicationRecord
  belongs_to :organization

  validates :name, presence: true, length: { in: 3..20 }
  validates :organization, presence: true
end
