require 'rails_helper'

RSpec.describe Account::DeviceGroupsController, type: :controller do
  render_views

  describe 'GET #index' do
    context 'with signed in user' do
      let!(:user) { create(:user) }

      before(:each) do
        sign_in user
        get :index
      end

      subject { response }

      it { is_expected.to have_http_status(200) }
      it { is_expected.to render_template('index') }
    end
  end  

  describe 'GET #new' do
    let!(:user) { create(:user) }

    context 'with signed in user' do
      before(:each) do
        sign_in user
        get :new
      end

      subject { response }

      it { is_expected.to have_http_status(200) }
      it { is_expected.to render_template('new') }
     end
  end
end