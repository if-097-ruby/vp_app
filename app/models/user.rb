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
  validates :terms_of_service, acceptance: true, on: :create

  after_create :send_signup_emails

  private

  def send_signup_emails  
      SignupMailer.with(user: self).welcome_email.deliver_now 
      SignupMailer.with(user: self).new_organization_created_email.deliver_now if User.exists?(role: 'super_admin')
  end

  def full_name
    "#{first_name}" + ' ' + "#{last_name}"
  end

end
