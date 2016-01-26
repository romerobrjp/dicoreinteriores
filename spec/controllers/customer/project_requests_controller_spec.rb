require 'rails_helper'

RSpec.describe Customer::ProjectRequestsController, type: :controller do
  include Devise::TestHelpers

  before(:each) do
    sign_in FactoryGirl.create(:customer)
  end

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all project_requests as @project_requests" do
      project_request = ProjectRequest.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:project_requests)).to eq([project_request])
    end
  end

  describe "GET #show" do
    it "assigns the requested project_request as @project_request" do
      project_request = ProjectRequest.create! valid_attributes
      get :show, {:id => project_request.to_param}, valid_session
      expect(assigns(:project_request)).to eq(project_request)
    end
  end

  describe "GET #new" do
    it "assigns a new project_request as @project_request" do
      get :new, {}, valid_session
      expect(assigns(:project_request)).to be_a_new(ProjectRequest)
    end
  end

  describe "GET #edit" do
    it "assigns the requested project_request as @project_request" do
      project_request = ProjectRequest.create! valid_attributes
      get :edit, {:id => project_request.to_param}, valid_session
      expect(assigns(:project_request)).to eq(project_request)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new ProjectRequest" do
        expect {
          post :create, {:project_request => valid_attributes}, valid_session
        }.to change(ProjectRequest, :count).by(1)
      end

      it "assigns a newly created project_request as @project_request" do
        post :create, {:project_request => valid_attributes}, valid_session
        expect(assigns(:project_request)).to be_a(ProjectRequest)
        expect(assigns(:project_request)).to be_persisted
      end

      it "redirects to the created project_request" do
        post :create, {:project_request => valid_attributes}, valid_session
        expect(response).to redirect_to(ProjectRequest.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved project_request as @project_request" do
        post :create, {:project_request => invalid_attributes}, valid_session
        expect(assigns(:project_request)).to be_a_new(ProjectRequest)
      end

      it "re-renders the 'new' template" do
        post :create, {:project_request => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested project_request" do
        project_request = ProjectRequest.create! valid_attributes
        put :update, {:id => project_request.to_param, :project_request => new_attributes}, valid_session
        project_request.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested project_request as @project_request" do
        project_request = ProjectRequest.create! valid_attributes
        put :update, {:id => project_request.to_param, :project_request => valid_attributes}, valid_session
        expect(assigns(:project_request)).to eq(project_request)
      end

      it "redirects to the project_request" do
        project_request = ProjectRequest.create! valid_attributes
        put :update, {:id => project_request.to_param, :project_request => valid_attributes}, valid_session
        expect(response).to redirect_to(project_request)
      end
    end

    context "with invalid params" do
      it "assigns the project_request as @project_request" do
        project_request = ProjectRequest.create! valid_attributes
        put :update, {:id => project_request.to_param, :project_request => invalid_attributes}, valid_session
        expect(assigns(:project_request)).to eq(project_request)
      end

      it "re-renders the 'edit' template" do
        project_request = ProjectRequest.create! valid_attributes
        put :update, {:id => project_request.to_param, :project_request => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested project_request" do
      project_request = ProjectRequest.create! valid_attributes
      expect {
        delete :destroy, {:id => project_request.to_param}, valid_session
      }.to change(ProjectRequest, :count).by(-1)
    end

    it "redirects to the project_requests list" do
      project_request = ProjectRequest.create! valid_attributes
      delete :destroy, {:id => project_request.to_param}, valid_session
      expect(response).to redirect_to(project_requests_url)
    end
  end

end
