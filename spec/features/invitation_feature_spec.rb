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

        expect(page).to have_content('An invitation email has been sent to letsdoit@gmail.com')
      end

      scenario 'fill in invalid email' do
        visit account_users_path
        fill_in 'Email', with: 'wrong'
        click_button 'Invite User'

        expect(page).to have_content('Email is invalid')
      end

      scenario 'after invitation sent should show status' do
        visit account_users_path
        fill_in 'Email', with: 'letsdoit@gmail.com'
        click_button 'Invite User'
        visit account_users_path
        expect(page).to have_content('waiting')
      end
    end

    context('accepting the invitaion') do
      before :each do
        sign_in user
        visit account_users_path
        fill_in 'Email', with: 'letsdoit@gmail.com'
        click_button 'Invite User'
        sign_out user
      end

      scenario 'admin invites new members to organization' do
        open_email 'letsdoit@gmail.com'
        visit_in_email 'Accept invitation'

        fill_in 'First Name', with: 'name'
        fill_in 'Last Name', with: 'last_name'
        fill_in 'Password', with: 'password'
        fill_in 'Confirm Password', with: 'password'

        click_button 'Continue'
        expect(page).to have_content('You are now signed in')
      end

      scenario 'user status should change afted user accepted the invitation' do
        open_email 'letsdoit@gmail.com'
        visit_in_email 'Accept invitation'

        fill_in 'First Name', with: 'name'
        fill_in 'Last Name', with: 'last_name'
        fill_in 'Password', with: 'password'
        fill_in 'Confirm Password', with: 'password'

        click_button 'Continue'

        sign_in user
        visit account_users_path
        expect(page).to have_content('accepted')
      end
    end
  end
end
