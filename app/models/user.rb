class User < ApplicationRecord
  belongs_to :organization

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])/x
  validates :first_name, :last_name, presence: true, length: { in: 2..50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  validates :password,
    presence: true,
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
