class Device < ApplicationRecord
  belongs_to :organization
  validates :name, :device_type, presence: true, length: { in: 3..40 }
end
