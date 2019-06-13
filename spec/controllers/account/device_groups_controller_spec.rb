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

  describe 'GET #edit' do
    let!(:user) { create(:admin, own_organization: organization) }
    let!(:organization) { create(:organization_with_device_groups, groups_count: 1) }

    context 'with signed in user' do
      before(:each) do
        sign_in user
        device_group = user.own_organization.device_groups.first
        get :edit, params: { id: device_group.id }
      end

      subject { response }

      it { is_expected.to have_http_status(200) }
      it { is_expected.to render_template('edit') }
    end
  end

  describe '#create' do
    let!(:user) { create(:admin, own_organization: organization) }
    let!(:organization) { create(:organization) }
    let!(:valid_params) { attributes_for(:device_group) }

    context 'as an authenticated user' do
      before do
        sign_in user
      end

      it 'create device_group' do
        expect do
          post :create, params: { device_group: valid_params }
        end.to change(user.own_organization.device_groups, :count).by(1)
      end

      it 'it should redirect after save' do
        post :create, params: { device_group: valid_params }
        expect(flash[:notice]).to eq 'Group saved!'
        expect(response).to redirect_to(account_device_groups_path)
      end
    end
  end

  describe '#update' do
    let!(:user) { create(:admin, own_organization: organization) }
    let!(:organization) { create(:organization_with_device_groups, groups_count: 1) }
    let!(:params) { attributes_for(:device_group) }

    context 'as an authenticated user' do
      before do
        sign_in user
      end

      it 'update device_group' do
        device_group = user.own_organization.device_groups.first
        params[:name] = 'Updated'
        put :update, params: { id: device_group.id, device_group: params }
        device_group.reload
        expect(device_group.name).to eq 'Updated'
        expect(response).to redirect_to(account_device_groups_path)
      end
    end
  end

  describe '#delete' do
     let!(:user) { create(:admin, own_organization: organization) }
    let!(:organization) { create(:organization_with_device_groups, groups_count: 1) }

    context 'with signed in user' do
      before(:each) do
        sign_in user
      end

      it 'create device_group' do
        device_group = user.own_organization.device_groups.first
        expect { delete :destroy, params: { id: device_group.id } }
        .to change(user.own_organization.device_groups, :count).by(-1)
      end
    end
  end
end
