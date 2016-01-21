require 'rails_helper'

RSpec.describe Customer::HomeController, type: :controller do
  include Devise::TestHelpers

  describe "GET #index" do
    it "returns http success" do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in FactoryGirl.create(:customer)
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
