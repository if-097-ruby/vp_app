class Contact < ActiveRecord::Base

  validates :name, presence: true

  validates :email, 
    presence: true,
     format: { 
       with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
       message: "must be a valid email address"
    }

  validates :message, presence: true

  after_create :send_contact_emails

  private

  def send_contact_emails
    ContactsMailer.with(contact: self).general_message.deliver_now 
  end  
end