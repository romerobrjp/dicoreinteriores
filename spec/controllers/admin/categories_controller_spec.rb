require 'rails_helper'

RSpec.describe Admin::CategoriesController, type: :controller do
  include Devise::TestHelpers

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:category)
  }

  let(:invalid_attributes) {
    {name: ''}
  }

  let(:valid_session) { {} }

  before(:each) do
    sign_in FactoryGirl.create(:admin)
  end

  describe "GET #index" do
    it "assigns all categories as @categories" do
      category = FactoryGirl.create(:category)
      get :index, {}, valid_session
      expect(assigns(:categories)).to eq([category])
    end
  end

  describe "GET #new" do
    it "assigns a new category as @category" do
      get :new, {}, valid_session
      expect(assigns(:category)).to be_a_new(Category)
    end
  end

  describe "GET #edit" do
    it "assigns the requested category as @category" do
      category = FactoryGirl.create(:category)
      get :edit, {:id => category.to_param}, valid_session
      expect(assigns(:category)).to eq(category)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Category" do
        expect {
          post :create, {:category => valid_attributes}, valid_session
        }.to change(Category, :count).by(1)
      end

      it "assigns a newly created category as @category" do
        post :create, {:category => valid_attributes}, valid_session
        expect(assigns(:category)).to be_a(Category)
        expect(assigns(:category)).to be_persisted
      end

      it "redirects to the created category" do
        post :create, {:category => valid_attributes}, valid_session
        expect(response).to redirect_to(admin_categories_url)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved category as @category" do
        post :create, {:category => invalid_attributes}, valid_session
        expect(assigns(:category)).to be_a_new(Category)
      end

      it "re-renders the 'new' template" do
        post :create, {:category => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {name: 'UPDATED CaTeGoRy'}
      }

      it "updates the requested category" do
        category = FactoryGirl.create(:category)
        put :update, {:id => category.to_param, :category => new_attributes}, valid_session
        category.reload
        expect(category.name).to eq('UPDATED CaTeGoRy')
      end

      it "assigns the requested category as @category" do
        category = FactoryGirl.create(:category)
        put :update, {:id => category.to_param, :category => valid_attributes}, valid_session
        expect(assigns(:category)).to eq(category)
      end

      it "redirects to the category" do
        category = FactoryGirl.create(:category)
        put :update, {:id => category.to_param, :category => valid_attributes}, valid_session
        expect(response).to redirect_to(admin_categories_url)
      end
    end

    context "with invalid params" do
      it "assigns the category as @category" do
        category = FactoryGirl.create(:category)
        put :update, {:id => category.to_param, :category => invalid_attributes}, valid_session
        expect(assigns(:category)).to eq(category)
      end

      it "re-renders the 'edit' template" do
        category = FactoryGirl.create(:category)
        put :update, {:id => category.to_param, :category => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested category" do
      category = FactoryGirl.create(:category)
      expect {
        delete :destroy, {:id => category.to_param}, valid_session
      }.to change(Category, :count).by(-1)
    end

    it "redirects to the categories list" do
      category = FactoryGirl.create(:category)
      delete :destroy, {:id => category.to_param}, valid_session
      expect(response).to redirect_to(admin_categories_url)
    end
  end

end
