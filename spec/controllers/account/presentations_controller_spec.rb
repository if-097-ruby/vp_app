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

  describe "POST #create" do
    let!(:user) { create(:user) }
    let!(:presentation) { create(:presentation) }
    
    context "as an authenticated user" do
       before(:each) do
        sign_in user
      end

      it 'create presentation' do
        expect {
          post :create, params: { presentation: attributes_for(:presentation).merge(
               attachment: Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/myfiles/makoginm-cv.doc"))) }
        }.to change(user.presentations, :count).by(1)
      end

      it 'it should redirect after save' do
        post :create, params: { presentation: attributes_for(:presentation).merge(
             attachment: Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/myfiles/makoginm-cv.doc"))) }
        expect(response).to redirect_to(account_presentations_path)
      end
    end
  end

  describe 'GET #edit' do
    let!(:user) { create(:user) }
    let!(:presentation) { create(:presentation, user: user) }

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

  describe 'PUT #update' do
    let!(:user) { create(:user)}
    let!(:presentation) { create(:presentation, user: user) }

    context 'as an authenticated user' do
      it 'update presentation' do
        new_presentation_params = FactoryBot.attributes_for(:presentation, name: 'Updated name')
        sign_in user
        put :update, params: { id: presentation.id, presentation: new_presentation_params }
        presentation.reload
        expect(presentation.name).to eq 'Updated name'
        expect(response).to redirect_to(account_presentations_path)
      end
    end
  end

  describe '#delete' do
    let!(:user) { create(:user)}
    let!(:presentation) { create(:presentation, user: user) }

    context 'with signed in user' do
      before(:each) do
        sign_in user
      end

      it 'delete presentation' do
        expect { delete :destroy, params: { id: presentation.id } }
          .to change(user.presentations, :count).by(-1)
      end

    it 'it should redirect after delete' do
        delete :destroy, params: { id: presentation.id }
        expect(response).to redirect_to(account_presentations_path)
      end
    end
  end
end
