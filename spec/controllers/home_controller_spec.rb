require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  render_views
  let!(:user) { create(:user) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template("index")
    end
  end
  
  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
      expect(response).to render_template("about")
    end
  end

  describe "GET #pricing" do
  it "returns http success" do
    get :pricing
    expect(response).to have_http_status(:success)
    expect(response).to render_template("pricing")
  end
end

end
