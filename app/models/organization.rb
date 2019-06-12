class Organization < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :device_groups, dependent: :destroy
  has_many :devices, as: :deviceable
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id', optional: true, inverse_of: :own_organization
  validates :name, presence: true, length: { in: 2..40 }
end
