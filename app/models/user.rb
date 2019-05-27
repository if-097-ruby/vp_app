class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: %i[member admin super_admin]

  belongs_to :organization, optional: true
  with_options inverse_of: :user do
    has_one :own_organization, class_name: 'Organization', foreign_key: 'owner_id', dependent: :destroy
  end
  accepts_nested_attributes_for :own_organization

  validates :first_name, :last_name, presence: true, length: { in: 2..50 }
  validates :terms_of_service, acceptance: true, on: :create

  after_create :send_signup_emails

  private

  def send_signup_emails
    SignupMailer.welcome_email(self).deliver_now
    super_admin = User.find_by(role: 'super_admin')
    SignupMailer.new_organization_created_email(self, super_admin).deliver_now if super_admin.present?
  end

  def full_name
    first_name.to_s + ' ' + last_name.to_s
  end
end
