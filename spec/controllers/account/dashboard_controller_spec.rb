require 'rails_helper'

RSpec.describe Account::DashboardController, type: :controller do
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

    context 'with guest user' do
      before(:each) do
        get :index
      end

      subject { response }

      it { is_expected.to be_redirect }
      it { is_expected.to redirect_to('/login') }
    end
  end
end