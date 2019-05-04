require 'rails_helper'

RSpec.describe Account::DashboardController, type: :controller do
  let!(:user) { create(:user) }

  describe "GET index" do
    it "should get index" do
      get 'index'
      response.should be_success
    end
  end
end
