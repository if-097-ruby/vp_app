class SignupMailer < ApplicationMailer
  default from: 'spacex@rails.com'

  def welcome_email(user)
    @first_name = user.first_name
    mail to: user.email, subject: 'Welcome to My Awesome Site'
  end

  def new_organization_created_email(user, super_admin)
    @user = user
    @super_admin = super_admin
    @organization = user.own_organization
    mail(to: @super_admin.email, subject: 'New organization created')
  end
end
