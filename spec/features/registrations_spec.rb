require 'rails_helper'

RSpec.feature "Registrations", type: :feature do
  context("registration process") do
    before(:each) do
      visit new_user_registration_path
      within('form') do
        fill_in "First name", with: "Daniel"
        fill_in "Last name", with: "Maestro"
        fill_in "Email", with: "letsdoit@gmail.com"
        fill_in "Password", with: "121212"
        fill_in "Password confirmation", with: "121212"
      end
    end

    scenario "should be successful" do
      within('form') do
        fill_in "Organization name", with: "Firstone"
      end
      expect { click_button "Sign up" }.to change(User, :count).by(1)
                                       .and change(Organization, :count).by(1)
      expect(page).to have_content("Welcome to SpaceX!")
    end

    scenario "should fail" do
      click_button "Sign up"
      expect(page).to have_content("Name can't be blank")
    end
  end

  context("log in process") do
    let!(:user) { create(:user) }

    scenario "should be successful" do
      visit new_user_session_path
      within('form') do
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
      end
      click_button 'Log in'
      expect(page).to have_content 'Welcome to SpaceX!'
    end
  end
end
