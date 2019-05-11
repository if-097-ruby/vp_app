class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :avatar
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:member, :admin, :super_admin]

  belongs_to :organization, optional: true
  has_one :own_organization, class_name: 'Organization', foreign_key: "owner_id"
  accepts_nested_attributes_for :own_organization

  validates :first_name, :last_name, presence: true, length: { in: 2..50 }


end
