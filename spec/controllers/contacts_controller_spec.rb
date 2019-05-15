require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  render_views

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST contact#create" do
    it "should create a new contact" do
      visit new_contact_path
      within('form') do
       fill_in "Name", with: "Ruby on Rails"
       fill_in "Email", with: "sdafsd@asdfasdf.com"
       fill_in "Message", with: "dfsdgsdfgfdg"
      end
    expect { click_button "Send message" }.to change(Contact, :count).by(1)
    end

    it 'should redirect to homepage' do
      post :create, params: { contact: {name: 'hah', email: 'asdf@sdfas.com', message: 'dsdfgsdfg' }}
      expect(response).to redirect_to(root_path)
      expect(flash[:success]).to eq "Message was successfully delivered"
    end   
  end

  describe "email after contact create" do
    context "when a contact is saved" do
      it "sends a email" do
        expect { post :create, params: { contact: {name: 'hah', email: 'asdf@sdfas.com', message: 'dsdfgsdfg' }} }.to change { ActionMailer::Base.deliveries.count }.by(1)
      end
    end
end
end

