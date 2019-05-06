class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:member, :admin, :super_admin]

  belongs_to :organization
  accepts_nested_attributes_for :organization

  validates :first_name, :last_name, presence: true, length: { in: 2..50 }
end
