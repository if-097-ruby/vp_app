class Device < ApplicationRecord
	validates :name, :device_type, :device_group_id , presence: true
	validates :name, :device_type, length: { in 3..40 }
	belongs_to :device_group
end
