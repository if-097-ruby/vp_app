class Device < ApplicationRecord
  belongs_to :device_group
  
  validates :name, :device_type, :device_group_id, presence: true
  validates :name, :device_type, length: { in: 3..40 }
end
