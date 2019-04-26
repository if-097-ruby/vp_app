class User < ApplicationRecord  
  belongs_to :organization

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :first_name, :last_name, presence: true, length: { in: 2..50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },	
                    uniqueness: true
  enum role: [:member, :admin, :super_admin]
end
