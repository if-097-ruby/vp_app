require 'rails_helper'

RSpec.describe Account::DeviceGroupsController, type: :controller do
  render_views

  let!(:device_group) { { device_group: { name: 'hah'} } }

    it "returns http success" do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template("index")
    end
  
end


