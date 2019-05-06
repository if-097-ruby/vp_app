class Organization < ApplicationRecord
  has_many :device_groups, dependent: :destroy
  has_many :users, dependent: :destroy
  accepts_nested_attributes_for :users

  validates :name, presence: true, length: { in: 2..40 }
end
