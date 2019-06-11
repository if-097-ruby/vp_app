require 'rails_helper'

RSpec.describe Account::DevicesController, type: :controller do
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

  describe 'GET #edit' do
    let!(:user) { create(:user, own_organization: organization) }
    let!(:organization) { create(:organization_with_device) }

    context 'with signed in user' do
      before(:each) do
        sign_in user
        get :edit, params: { id: user.own_organization.devices.first.id }
      end

      subject { response }

      it { is_expected.to have_http_status(200) }
      it { is_expected.to render_template('edit') }
    end
  end

  describe '#create' do
    let!(:user) { create(:user) }
    let!(:device) { create(:device) }

    context 'as an authenticated user' do
      before do
        @device_params = FactoryBot.attributes_for(:device)
      end

      it 'create device' do
        sign_in user
        expect do
          post :create, params: { device: @device_params }
        end.to change(user.own_organization.devices, :count).by(1)
      end

      it 'it should redirect after save' do
        sign_in user
        post :create, params: { device: @device_params }
        expect(flash[:notice]).to eq 'Device saved!'
        expect(response).to redirect_to(account_devices_path)
      end
    end
  end

  describe '#update' do
    let!(:user) { create(:user, own_organization: organization) }
    let!(:organization) { create(:organization_with_device) }

    context 'as an authenticated user' do
      it 'update device' do
        new_device_params = FactoryBot.attributes_for(:device)
        new_device_params[:name] = 'Updated'
        sign_in user
        put :update, params: { id: user.own_organization.devices.first.id, device: new_device_params }
        user.own_organization.devices.first.reload
        expect(user.own_organization.devices.first.name).to eq 'Updated'
        expect(response).to redirect_to(account_devices_path)
      end
    end
  end

  describe '#delete' do
    let!(:user) { create(:user, own_organization: organization) }
    let!(:organization) { create(:organization_with_device) }

    context 'with signed in user' do
      before(:each) do
        sign_in user
      end

      it 'create device' do
        sign_in user
        expect { delete :destroy, params: { id: user.own_organization.devices.first.id } }
          .to change(user.own_organization.devices, :count).by(-1)
      end
    end
  end
end
