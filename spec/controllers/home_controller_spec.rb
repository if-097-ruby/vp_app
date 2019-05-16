require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let!(:user) { create(:user) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

end
