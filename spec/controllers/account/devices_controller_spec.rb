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
    let!(:user) { create(:admin, own_organization: organization) }
    let!(:organization) { create(:organization ) }

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
    let!(:user) { create(:admin, own_organization: organization) }
    let!(:organization) { create(:organization_with_devices, devices_count: 1) }

    context 'with signed in user' do
      before(:each) do
        sign_in user
        device = user.organization.devices.first
        get :edit, params: { id: device.id }
      end

      subject { response }

      it { is_expected.to have_http_status(200) }
      it { is_expected.to render_template('edit') }
    end
  end

  describe '#create' do
    let!(:user) { create(:admin, own_organization: organization) }
    let!(:organization) { create(:organization) }
    let!(:valid_params) { attributes_for(:device) }

    context 'as an authenticated user' do
      before(:each) do
        sign_in user
      end

      it 'create device' do
        expect do
          post :create, params: { device: valid_params }
        end.to change(user.organization.devices, :count).by(1)
      end

      it 'it should redirect after save' do
        post :create, params: { device: valid_params }
        expect(flash[:notice]).to eq 'Device saved!'
        expect(response).to redirect_to(account_devices_path)
      end
    end
  end

  describe '#update' do
    let!(:user) { create(:admin, own_organization: organization) }
    let!(:organization) { create(:organization_with_devices, devices_count: 1) }
    let!(:params) { attributes_for(:device) }

    context 'with signed in user' do
      before(:each) do
        sign_in user
      end
    
      it 'update device' do
        device = user.organization.devices.first
        params[:name] = 'Updated'
        put :update, params: { id: device.id, device: params }
        device.reload
        expect(device.name).to eq 'Updated'
        expect(response).to redirect_to(account_devices_path)
      end
    end
  end 

  describe '#delete' do
    let!(:user) { create(:admin, own_organization: organization) }
    let!(:organization) { create(:organization_with_devices, devices_count: 1) }

    context 'with signed in user' do
      before(:each) do
        sign_in user
      end

      it 'create device' do
        device = user.organization.devices.first
        expect { delete :destroy, params: { id: device.id } }
        .to change(user.organization.devices, :count).by(-1)
      end
    end
  end
end
