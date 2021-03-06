class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :avatar
  has_many :presentations, dependent: :destroy

  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: %i[member admin super_admin]

  belongs_to :organization, optional: true
  has_one :own_organization, class_name: 'Organization', foreign_key: 'owner_id', inverse_of: :owner, dependent: :destroy
  accepts_nested_attributes_for :own_organization

  validates :first_name, :last_name, presence: true, length: { in: 2..50 }
  validates :terms_of_service, acceptance: true, on: :create

  after_create :send_signup_emails, :set_admin_role

  def full_name
    [first_name, last_name].reject(&:blank?).join(' ')
  end

  def status
    if self.invitation_accepted?
      'accepted'
    else
      'waiting'
    end
  end

  private

  def send_signup_emails
    SignupMailer.welcome_email(self).deliver_now if own_organization.present?
    super_admin = User.find_by(role: 'super_admin')
    if super_admin.present? && own_organization.present?
      SignupMailer.new_organization_created_email(self, super_admin).deliver_now
    end
  end

  def set_admin_role
   return if own_organization.blank?
   update_attribute :role, 'admin'
   self.own_organization.users.push(self)
  end
end
