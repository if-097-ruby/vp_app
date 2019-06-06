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
    let!(:user) { create(:user) }

    context 'with signed in user' do
      before(:each) do
        sign_in user
        get :edit
      end

      subject { response }

      it { is_expected.to have_http_status(200) }
      it { is_expected.to render_template('edit') }
    end
  end

  describe 'PUT #update' do
    before(:each) do
      @user = create(:user)
      sign_in(@user)
    end

    context 'with valid attributes' do
      it 'should update the promo and redirect to the index' do
        process :update, method: :put, params: { id: @user.id, user: attributes_for(:user, first_name: 'Updated Name') }
        @user.reload
        expect(@user.first_name).to eq 'Updatedc Name'
        expect(response).to redirect_to(account_profile_path)
      end
    end
  end
end
