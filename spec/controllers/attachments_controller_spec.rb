require 'rails_helper'

RSpec.describe AttachmentsController, type: :controller do
  include Devise::TestHelpers

  before(:each) do
    sign_in FactoryGirl.create(:customer)
  end

  describe "GET #ng-upload" do
    it "returns http success" do
      post :ng_upload, FactoryGirl.attributes_for(:attachment)
      expect(response).to have_http_status(:success)
    end
  end

end
