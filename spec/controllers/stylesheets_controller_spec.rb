require 'rails_helper'

RSpec.describe StylesheetsController, type: :controller do

  describe "GET #rcss" do
    it "returns http success" do
      get :rcss
      expect(response).to have_http_status(:success)
    end
  end

end
