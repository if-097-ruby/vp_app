class SignupMailer < ApplicationMailer
  default from: 'spacex@rails.com'

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def new_organization_created_email
    @user = params[:user]
    @super_admin = User.find_by_role("super_admin")
    @organization = Organization.find_by_owner_id(@user.id)
    mail(to: @super_admin.email, subject: "New organization created")
  end
end