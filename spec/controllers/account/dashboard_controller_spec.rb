require 'rails_helper'

RSpec.describe Account::DashboardController, type: :controller do
  render_views
  
  let!(:user) { create(:user, first_name: "User", last_name: "Surname",
  email: "example@gmail.com", password: "password", 
  password_confirmation: "password") }

  describe "GET index" do
    it "should get index" do
      sign_in user
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
