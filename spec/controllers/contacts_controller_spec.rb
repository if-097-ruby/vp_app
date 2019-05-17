require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  render_views

  let!(:params) { { contact: { name: 'hah', email: 'asdf@sdfas.com', message: 'dsdfgsdfg' } } }

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST contact#create" do
    it "should create a new contact" do
      expect { post :create, params: params }.to change(Contact, :count).by(1)
    end

    it 'should redirect to homepage' do
      post :create, params: params
      expect(response).to redirect_to(root_path)
      expect(flash[:success]).to eq "Message was successfully delivered"
    end   
  end

  describe "email after contact create" do
    it "sends an email" do
      expect { post :create, params: params }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end


