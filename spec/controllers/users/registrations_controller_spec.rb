require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do


  describe "Create action" do
    context "after user signed up" do
    
    # let!(:params) { { user: { first_name: "Simple", last_name: "User", email: "simple@user.com", password: "password",
    #                                   password_confirmation: "password", role: "member", terms_of_service: "1",
    #                                  own_organization_attributes: {name: "12321"}} }}
    # let!(:super_admin) { create(:user, first_name: "Super", last_name: "Admin", email: "super@admin.com", password: "password",
    #                                   password_confirmation: "password", role: "super_admin", terms_of_service: "1",
    #                                  own_organization_attributes: {name: "super_organization"}) }
 
    let!(:super_admin){ build(:super_admin) }
    let!(:user){ build(:user) }
  
    it "sends an email to super_admin and to signed up user" do
      request.env["devise.mapping"] = Devise.mappings[:user]     
      expect { post :create, params: admin }.to change { Devise.mailer.deliveries.count }.by(2)
    end

    end
  end
end