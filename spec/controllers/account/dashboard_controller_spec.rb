require 'rails_helper'

RSpec.describe Account::DashboardController, type: :controller do
  render_views
  let!(:user) { create(:user) }

  describe "Index action" do
    it "renders index template if user signed in" do
      sign_in user
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template("index")
    end

    it "doesn't render index action if user is not signed in" do
    	get :index
    	expect(response).to_not have_http_status(200)
    end
  end
end
