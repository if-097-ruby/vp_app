class DeviceGroup < ApplicationRecord
  has_many :devices, dependent: :destroy
  belongs_to :organization, class_name: 'Organization', foreign_key: "organization_id", optional: true

  validates :name, presence: true, length: { in: 3..20 }
end
