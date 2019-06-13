class Device < ApplicationRecord
  belongs_to :organization
  has_and_belongs_to_many :device_groups, optional: true
  validates :name, :device_type, presence: true, length: { in: 3..40 }
end
