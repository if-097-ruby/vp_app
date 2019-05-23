require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do


  describe "Create action" do
    context "after user signed up" do
 
    let!(:super_admin){ create(:super_admin) }
    let!(:admin){ build(:admin) }
  
    it "sends an email to super_admin and to signed up user" do
      request.env["devise.mapping"] = Devise.mappings[:user]     
      expect { post :create, params: admin }.to change { Devise.mailer.deliveries.count }.by(2)
    end

    end
  end
end