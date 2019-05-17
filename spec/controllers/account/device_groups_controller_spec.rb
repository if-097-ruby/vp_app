require 'rails_helper'

RSpec.describe Account::DeviceGroupsController, type: :controller do
  render_views

  describe "GET index" do
    it "should get index" do
      let!(:device_group) { create(:device_group) }
      get 'index'
      expect(response).to have_http_status(200)
    end
  end
end