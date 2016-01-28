require 'rails_helper'

RSpec.describe Admin::SpaceTypesController, type: :controller do
  include Devise::TestHelpers

  before(:each) do
    sign_in FactoryGirl.create(:admin)
  end

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:space_type)
  }

  let(:invalid_attributes) {
    {name: ''}
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all space_types as @space_types" do
      space_type = FactoryGirl.create(:space_type)
      get :index, {}, valid_session
      expect(assigns(:space_types)).to eq([space_type])
    end
  end

  describe "GET #new" do
    it "assigns a new space_type as @space_type" do
      get :new, {}, valid_session
      expect(assigns(:space_type)).to be_a_new(SpaceType)
    end
  end

  describe "GET #edit" do
    it "assigns the requested space_type as @space_type" do
      space_type = FactoryGirl.create(:space_type)
      get :edit, {:id => space_type.to_param}, valid_session
      expect(assigns(:space_type)).to eq(space_type)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new SpaceType" do
        expect {
          post :create, {:space_type => valid_attributes}, valid_session
        }.to change(SpaceType, :count).by(1)
      end

      it "assigns a newly created space_type as @space_type" do
        post :create, {:space_type => valid_attributes}, valid_session
        expect(assigns(:space_type)).to be_a(SpaceType)
        expect(assigns(:space_type)).to be_persisted
      end

      it "redirects to the created space_type" do
        post :create, {:space_type => valid_attributes}, valid_session
        expect(response).to redirect_to(admin_space_types_url)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved space_type as @space_type" do
        post :create, {:space_type => invalid_attributes}, valid_session
        expect(assigns(:space_type)).to be_a_new(SpaceType)
      end

      it "re-renders the 'new' template" do
        post :create, {:space_type => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {name: 'New Name'}
      }

      it "updates the requested space_type" do
        space_type = FactoryGirl.create(:space_type)
        put :update, {:id => space_type.to_param, :space_type => new_attributes}, valid_session
        space_type.reload
        expect(space_type.name).to eq('New Name')
      end

      it "assigns the requested space_type as @space_type" do
        space_type = FactoryGirl.create(:space_type)
        put :update, {:id => space_type.to_param, :space_type => valid_attributes}, valid_session
        expect(assigns(:space_type)).to eq(space_type)
      end

      it "redirects to the space_type" do
        space_type = FactoryGirl.create(:space_type)
        put :update, {:id => space_type.to_param, :space_type => valid_attributes}, valid_session
        expect(response).to redirect_to(admin_space_types_url)
      end
    end

    context "with invalid params" do
      it "assigns the space_type as @space_type" do
        space_type = FactoryGirl.create(:space_type)
        put :update, {:id => space_type.to_param, :space_type => invalid_attributes}, valid_session
        expect(assigns(:space_type)).to eq(space_type)
      end

      it "re-renders the 'edit' template" do
        space_type = FactoryGirl.create(:space_type)
        put :update, {:id => space_type.to_param, :space_type => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested space_type" do
      space_type = FactoryGirl.create(:space_type)
      expect {
        delete :destroy, {:id => space_type.to_param}, valid_session
      }.to change(SpaceType, :count).by(-1)
    end

    it "redirects to the space_types list" do
      space_type = FactoryGirl.create(:space_type)
      delete :destroy, {:id => space_type.to_param}, valid_session
      expect(response).to redirect_to(admin_space_types_url)
    end
  end

end
