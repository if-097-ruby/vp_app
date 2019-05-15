class Organization < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :device_groups, dependent: :destroy
  belongs_to :owner, class_name: 'User', foreign_key: "owner_id", optional: true

  validates :name, presence: true, length: { in: 2..40 }
end
