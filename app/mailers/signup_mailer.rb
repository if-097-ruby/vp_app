class SignupMailer < ApplicationMailer
  default from: 'spacex@rails.com'

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
