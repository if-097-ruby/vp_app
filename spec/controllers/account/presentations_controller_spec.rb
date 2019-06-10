require 'rails_helper'

RSpec.describe Account::PresentationsController, type: :controller do
  render_views

  # describe 'GET #index' do
  #   context 'with signed in user' do
  #     let!(:user) { create(:user) }

  #     before(:each) do
  #       sign_in user
  #       get :index
  #     end

  #     subject { response }

  #     it { is_expected.to have_http_status(200) }
  #     it { is_expected.to render_template('index') }
  #     it { expect(response.body).to have_text('Presentations') }
  #   end
  # end

  # describe 'GET #new' do
  #   let!(:user) { create(:user) }

  #   context 'with signed in user' do
  #     before(:each) do
  #       sign_in user
  #       get :new
  #     end

  #     subject { response }

  #     it { is_expected.to have_http_status(200) }
  #     it { is_expected.to render_template('new') }
  #   end
  # end

  # describe '#create' do
  #   let!(:user) { create(:user) }
  #   let!(:presentation) { create(:presentation) }

  #   context 'as an authenticated user' do
  #     before do
  #       @presentation_params = FactoryBot.attributes_for(:presentation)
  #     end

  #     it 'create presentation' do
  #       sign_in user
  #       expect do
  #         post :create, params: { presentation: @presentation_params }
  #       end.to change(user.presentations, :count).by(1)
  #     end

  #     it 'it should redirect after save' do
  #       sign_in user
  #       post :create, params: { presentation: @presentation_params }
  #       expect(response).to redirect_to(account_presentations_path)
  #     end
  #   end
  # end

  describe 'GET #edit' do
    let!(:user) { create(:user) }
    let!(:presentation) { create(:presentation) }

    context 'with signed in user' do
      before(:each) do
        sign_in user
        get :edit, params: { id: user.presentations.last.id }
      end

      subject { response }

      it { is_expected.to have_http_status(200) }
      it { is_expected.to render_template('edit') }
    end
  end
end
