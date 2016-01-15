require 'rails_helper'

RSpec.describe "Admin::Preferences", type: :request do
  describe "GET /admin_preferences" do
    it "works! (now write some real specs)" do
      get admin_preferences_path
      expect(response).to have_http_status(302)
    end
  end
end
