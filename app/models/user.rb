class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:member, :admin, :super_admin]

  belongs_to :organization, optional: true

  validates :first_name, :last_name, presence: true, length: { in: 2..50 }
end
