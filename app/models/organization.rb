class Organization < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :device_groups, dependent: :destroy

  validates :name, presence: true, length: { in: 3..40 }
end
