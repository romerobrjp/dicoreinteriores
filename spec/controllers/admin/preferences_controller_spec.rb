require 'rails_helper'

RSpec.describe Admin::PreferencesController, type: :controller do
  include Devise::TestHelpers

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:preference)
  }

  let(:invalid_attributes) {
    {color_1: '', color_2: '', color_3: ''}
  }

  let(:valid_session) { {} }

  before(:each) do
    sign_in FactoryGirl.create(:admin)
  end

  describe "GET #index" do
    it "assigns all preferences as @preferences" do
      preference = FactoryGirl.create(:preference)
      get :index, {}, valid_session
      expect(assigns(:preferences)).to eq([preference])
    end
  end

  describe "GET #show" do
    it "assigns the requested preference as @preference" do
      preference = FactoryGirl.create(:preference)
      get :show, {:id => preference.to_param}, valid_session
      expect(assigns(:preference)).to eq(preference)
    end
  end

  describe "GET #new" do
    it "assigns a new preference as @preference" do
      get :new, {}, valid_session
      expect(assigns(:preference)).to be_a_new(Preference)
    end
  end

  describe "GET #edit" do
    it "assigns the requested preference as @preference" do
      preference = FactoryGirl.create(:preference)
      get :edit, {:id => preference.to_param}, valid_session
      expect(assigns(:preference)).to eq(preference)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Preference" do
        expect {
          post :create, {:preference => valid_attributes}, valid_session
        }.to change(Preference, :count).by(1)
      end

      it "assigns a newly created preference as @preference" do
        post :create, {:preference => valid_attributes}, valid_session
        expect(assigns(:preference)).to be_a(Preference)
        expect(assigns(:preference)).to be_persisted
      end

      it "redirects to the created preference" do
        post :create, {:preference => valid_attributes}, valid_session
        expect(response).to redirect_to(admin_preference_url(Preference.last))
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved preference as @preference" do
        post :create, {:preference => invalid_attributes}, valid_session
        expect(assigns(:preference)).to be_a_new(Preference)
      end

      it "re-renders the 'new' template" do
        post :create, {:preference => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {color_1: '#111111', color_2: '#222222', color_3: '#333333'}
      }

      it "updates the requested preference" do
        preference = FactoryGirl.create(:preference)
        put :update, {:id => preference.to_param, :preference => new_attributes}, valid_session
        preference.reload
        expect(preference.color_1).to eq('#111111')
        expect(preference.color_2).to eq('#222222')
        expect(preference.color_3).to eq('#333333')
      end

      it "assigns the requested preference as @preference" do
        preference = FactoryGirl.create(:preference)
        put :update, {:id => preference.to_param, :preference => valid_attributes}, valid_session
        expect(assigns(:preference)).to eq(preference)
      end

      it "redirects to the preference" do
        preference = FactoryGirl.create(:preference)
        put :update, {:id => preference.to_param, :preference => valid_attributes}, valid_session
        expect(response).to redirect_to(admin_preference_url(preference))
      end
    end

    context "with invalid params" do
      it "assigns the preference as @preference" do
        preference = FactoryGirl.create(:preference)
        put :update, {:id => preference.to_param, :preference => invalid_attributes}, valid_session
        expect(assigns(:preference)).to eq(preference)
      end

      it "re-renders the 'edit' template" do
        preference = FactoryGirl.create(:preference)
        put :update, {:id => preference.to_param, :preference => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested preference" do
      preference = FactoryGirl.create(:preference)
      expect {
        delete :destroy, {:id => preference.to_param}, valid_session
      }.to change(Preference, :count).by(-1)
    end

    it "redirects to the preferences list" do
      preference = FactoryGirl.create(:preference)
      delete :destroy, {:id => preference.to_param}, valid_session
      expect(response).to redirect_to(admin_preferences_url)
    end
  end

end
