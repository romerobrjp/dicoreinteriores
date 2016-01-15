require 'rails_helper'

RSpec.describe "Admin::Assets", type: :request do
  describe "GET /admin_assets" do
    it "will return 302 for unathourized access" do
      get admin_assets_path
      expect(response).to have_http_status(302)
    end
  end
end
