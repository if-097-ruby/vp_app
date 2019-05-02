require 'rails_helper'

RSpec.describe Account::UsersController, type: :controller do
  let!(:user) { build(:user) }

  describe "GET index" do
    it "should get index" do
      get 'index'
      response.should be_success
    end
  end
end
