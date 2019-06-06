require 'rails_helper'

RSpec.describe Account::PresentationsController, type: :controller do
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
    let!(:user) { create(:user) }
    let!(:presentation) { create(:presentation) }

    context 'with signed in user' do
      before(:each) do
        sign_in user
        get :edit, params: { id: presentation.id }
      end

      subject { response }

      it { is_expected.to have_http_status(200) }
      it { is_expected.to render_template('edit') }
    end
  end

  describe 'POST #create' do
    let!(:user) { create(:user) }
    let!(:presentation) { create(:presentation) }

    it 'should create a new presentation' do
      sign_in user
      expect { create(:presentation) }.to change(Presentation, :count).by(1)
    end
  end

  describe 'PUT #update' do
    before(:each) do
      @user = create(:user)
      sign_in(@user)
      @presentation = create(:presentation)
    end

    context 'with valid attributes' do
      it 'should update the promo and redirect to the index' do
        process :update, method: :put, params: { id: @presentation.id, 
                presentation: attributes_for(:presentation, name: 'Updated name') }
        @presentation.reload
        response.should be_successful
      end
    end
  end
end
