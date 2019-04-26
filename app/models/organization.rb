class Organization < ApplicationRecord
  validates :name, presence: true, length: { maximum: 40 }
  has_many :users, dependent: :destroy
  has many :device_groups
end
