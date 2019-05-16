require 'rails_helper'

RSpec.describe Account::ProfilesController, type: :controller do
  render_views

  describe 'GET #show' do
    context 'with signed in user' do
      let!(:user) { create(:user) }

      before(:each) do
        sign_in user

        get :show
      end

      subject { response }

      it { is_expected.to have_http_status(200) }
      it { is_expected.to render_template('show') }
    end
  end

  describe 'GET #edit' do
    context 'with signed in user' do
      let!(:user) { create(:user) }

      before(:each) do
        sign_in user

        get :edit
      end

      subject { response }

      it { is_expected.to have_http_status(200) }
      it { is_expected.to render_template('edit') }
    end
  end
end