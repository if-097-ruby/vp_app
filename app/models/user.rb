class User < ApplicationRecord
  belongs_to :organization
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true, length: { in: 2..50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  VALID_PASSWORD_REGEX = /\A(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])/x
  validates :password, 
    presence: true
    format: { with: VALID_PASSWORD_REGEX }, 
    confirmation: true, 
    on: :create 
  validates :password, 
    allow_nil: true, 
    format: { with: VALID_PASSWORD_REGEX }, 
    confirmation: true, 
    on: :update
  enum role: [:member, :admin, :super_admin]
end
