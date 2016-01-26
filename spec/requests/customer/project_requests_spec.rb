require 'rails_helper'

RSpec.describe "ProjectRequests", type: :request do
  describe "GET /project_requests" do
    it "works! (now write some real specs)" do
      get customer_project_requests_path
      expect(response).to have_http_status(302)
    end
  end
end
