require 'rails_helper'

include ActionDispatch::TestProcess

RSpec.describe Admin::AssetsController, type: :controller do
  include Devise::TestHelpers

  let(:valid_attributes) {
    {file: fixture_file_upload('test.png', 'image/png') }
  }

  let(:invalid_attributes) {
    {file: nil}
  }

  before(:each) do
    sign_in FactoryGirl.create(:admin)
  end

  describe "GET #index" do
    it "assigns all admin_assets as @admin_assets" do
      asset = FactoryGirl.create(:asset)
      get :index
      expect(assigns(:assets)).to eq([asset])
    end
  end

  describe "GET #show" do
    it "assigns the requested admin_asset as @admin_asset" do
      asset = FactoryGirl.create(:asset)
      get :show, {:id => asset.to_param}
      expect(assigns(:asset)).to eq(asset)
    end
  end

  describe "GET #new" do
    it "assigns a new admin_asset as @admin_asset" do
      get :new
      expect(assigns(:asset)).to be_a_new(Asset)
    end
  end

  describe "GET #edit" do
    it "assigns the requested admin_asset as @admin_asset" do
      asset = FactoryGirl.create(:asset)
      get :edit, {:id => asset.to_param}
      expect(assigns(:asset)).to eq(asset)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Asset" do
        expect {
          post :create, {:asset => valid_attributes}
        }.to change(Asset, :count).by(1)
      end

      it "assigns a newly created admin_asset as @admin_asset" do
        post :create, { :asset => valid_attributes }
        expect(assigns(:asset)).to be_a(Asset)
        expect(assigns(:asset)).to be_persisted
      end

      it "redirects to the created admin_asset" do
        post :create, {:asset => valid_attributes}
        expect(response).to redirect_to(admin_asset_url(Asset.last))
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved admin_asset as @admin_asset" do
        post :create, {:asset => invalid_attributes}
        expect(assigns(:asset)).to be_a_new(Asset)
      end

      it "re-renders the 'new' template" do
        post :create, {:asset => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {description: 'Description updated'}
      }

      it "updates the requested admin_asset" do
        asset = FactoryGirl.create(:asset)
        put :update, {:id => asset.to_param, :asset => new_attributes}
        asset.reload
        expect(asset.description).to eq('Description updated')
        expect(asset.file).to_not be_nil
      end

      it "assigns the requested admin_asset as @admin_asset" do
        asset = FactoryGirl.create(:asset)
        put :update, {:id => asset.to_param, :asset => valid_attributes}
        expect(assigns(:asset)).to eq(asset)
      end

      it "redirects to the admin_asset" do
        asset = FactoryGirl.create(:asset)
        put :update, {:id => asset.to_param, :asset => valid_attributes}
        expect(response).to redirect_to(admin_asset_url(asset))
      end
    end

    context "with invalid params" do
      it "assigns the admin_asset as @admin_asset" do
        asset = FactoryGirl.create(:asset)
        put :update, {:id => asset.to_param, :asset => invalid_attributes}
        expect(assigns(:asset)).to eq(asset)
      end

      it "re-renders the 'edit' template" do
        asset = FactoryGirl.create(:asset)
        put :update, {:id => asset.to_param, :asset => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested admin_asset" do
      asset = FactoryGirl.create(:asset)
      expect {
        delete :destroy, {:id => asset.to_param}
      }.to change(Asset, :count).by(-1)
    end

    it "redirects to the admin_assets list" do
      asset = FactoryGirl.create(:asset)
      delete :destroy, {:id => asset.to_param}
      expect(response).to redirect_to(admin_assets_url)
    end
  end

end
