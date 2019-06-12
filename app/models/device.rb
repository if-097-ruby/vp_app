class Device < ApplicationRecord
  belongs_to :deviceable, polymorphic: true
  validates :name, :device_type, presence: true, length: { in: 3..40 }
end
