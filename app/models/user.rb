class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:member, :admin, :super_admin]

  has_one :own_organization, class_name: 'Organization', foreign_key: 'owner_id'
  belongs_to :organization, optional: true
  accepts_nested_attributes_for :own_organization

  validates :first_name, :last_name, presence: true, length: { in: 2..50 }
end
