class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. 
  def headers
    {
      :subject => "My Contact Form",
      :to => "vikaluk@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end
