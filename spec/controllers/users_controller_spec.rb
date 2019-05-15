require 'rails_helper'

RSpec.describe Account::UsersController, type: :controller do
  let!(:user) { create(:user) }

  describe "GET index" do
    it "should get index" do
      get 'index'
      expect(response).to have_http_status(200)
    end
  end
end
