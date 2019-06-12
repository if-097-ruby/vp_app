require 'rails_helper'

RSpec.describe Account::UsersController, type: :controller do
  let!(:user) { create(:admin) }

  describe 'GET index' do
    it 'should get index' do
      sign_in user
      get 'index'
      expect(response).to have_http_status(200)
    end
  end
end
