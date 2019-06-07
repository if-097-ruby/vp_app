require 'rails_helper'


RSpec.feature 'Invitations', type: :feature do
  describe 'invitations'  do
    let(:user) { create(:admin) }

    context('inviting new members') do
      before :each do
        sign_in user
      end
    
      scenario 'admin invites new members to organization' do
        visit account_users_path
        fill_in 'Email', with: 'letsdoit@gmail.com'
        click_button 'Invite User'

        expect(page).to have_content("An invitation email has been sent to letsdoit@gmail.com")
      end

      scenario 'fill in invalid email' do
        visit account_users_path
        fill_in 'Email', with: 'wrong'
        click_button 'Invite User'

        expect(page).to have_content("Email is invalid")
      end

      scenario 'after invitation sent should show status' do
        visit account_users_path
        fill_in 'Email', with: 'letsdoit@gmail.com'
        click_button 'Invite User'
        visit account_users_path
        expect(page).to have_content("waiting")
      end
    end
  end
end