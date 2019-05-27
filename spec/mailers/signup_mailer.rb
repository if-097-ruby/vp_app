require 'rails_helper'

RSpec.describe SignupMailer, type: :mailer do
  describe 'welcome_email' do
    let!(:user) { create(:user) }
    let!(:mail) { SignupMailer.welcome_email(user) }

    it 'renders the subject' do
      expect(mail.subject).to eql('Welcome to My Awesome Site')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['spacex@rails.com'])
    end

    it 'assigns @name' do
      expect(mail.body.encoded).to match(user.first_name)
    end
  end

  describe 'new_organization_created_email' do
    let!(:user) { create(:user) }
    let!(:super_admin) { create(:super_admin) }
    let!(:mail) { SignupMailer.new_organization_created_email(user, super_admin) }

    it 'renders the subject' do
      expect(mail.subject).to eql('New organization created')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql([super_admin.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['spacex@rails.com'])
    end

    it 'assigns @name' do
      expect(mail.body.encoded).to match(user.first_name)
    end

    it 'assigns @organization_name' do
      expect(mail.body.encoded).to match(user.own_organization.name)
    end
  end
end
