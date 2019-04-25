class Organization < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :device_groups
  validates :name, presence: true, length: { maximum: 40 }
end