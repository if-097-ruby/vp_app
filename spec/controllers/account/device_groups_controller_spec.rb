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

  describe '#create' do
    context 'as an authenticated user' do
      before do
        @user = FactoryBot.create(:user)
        @device_group = FactoryBot.create(:device_group)
      end

      it 'create device_group' do
        device_group_params = FactoryBot.attributes_for(:device_group)
        sign_in @user
        expect do
          post :create, params: { device_group: device_group_params }
        end.to change(@user.own_organization.device_groups, :count).by(1)
      end

      it 'it should redirect after save' do
        device_group_params = FactoryBot.attributes_for(:device_group)
        sign_in @user
        post :create, params: { device_group: device_group_params }
        expect(flash[:notice]).to eq 'Group saved!'
        expect(response).to redirect_to(account_device_groups_path)
      end
    end
  end

  describe '#update' do
    context 'as an authenticated user' do
      before do
        @user = FactoryBot.create(:user)
        @user.own_organization = FactoryBot.create(:organization_with_device_group)
      end

      it 'update device_group' do
        new_device_group_params = FactoryBot.attributes_for(:device_group)
        new_device_group_params[:name] = 'Updated'
        sign_in @user
        put :update, params: { id: @user.own_organization.device_groups.first.id, device_group: new_device_group_params }
        @user.own_organization.device_groups.first.reload
        expect(@user.own_organization.device_groups.first.name).to eq 'Updated'
        expect(response).to redirect_to(account_device_groups_path)
      end
    end
  end
end
