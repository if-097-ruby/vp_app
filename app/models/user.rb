class User < ApplicationRecord
  belongs_to :organization
  validates :first_name, :last_name, presence: true, length: { in: 2..40 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },	
                    uniqueness: true
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => {:within => 6..40},
                       :on => :create
  validates :password, :confirmation => true,
                      :length => {:within => 6..40},
                       :allow_blank => true,
                       :on => :update
  enum role: [:member, :admin, :super_admin]
  after_initialize :set_default_role, :if => :new_record?

  private

  def set_default_role
    self.role ||= :member
  end
end
