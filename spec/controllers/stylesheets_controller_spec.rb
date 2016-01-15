require 'rails_helper'

RSpec.describe StylesheetsController, type: :controller do

  describe "GET #theme" do
    it "returns http success" do
      Preference.create!(color_1: '#111111', color_2: '#222222', color_3: '#333333', specific_id: 'global_prefs')
      get :theme
      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq('text/css')
    end
  end

end
