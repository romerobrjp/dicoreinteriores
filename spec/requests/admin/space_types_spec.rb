require 'rails_helper'

RSpec.describe "SpaceTypes", type: :request do

  describe "GET /space_types" do
    it "works! (now write some real specs)" do
      get admin_space_types_path
      expect(response).to have_http_status(302)
    end
  end
end
