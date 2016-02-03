require 'rails_helper'


RSpec.describe Admin::UsersController, type: :controller do
  include Devise::TestHelpers

  let(:admin_valid_attributes) {
    FactoryGirl.attributes_for(:admin)
  }

  let(:customer_valid_attributes) {
    FactoryGirl.attributes_for(:customer)
  }

  let(:invalid_attributes) {
    {email: ''}
  }

  let(:valid_session) { {} }

  before(:each) do
    sign_in FactoryGirl.create(:admin)
  end

  describe "GET #index" do
    it "assigns all users as @users" do
      user = FactoryGirl.create(:admin)
      get :index, {}, valid_session
      expect(assigns(:users).last).to eq(user)
    end
  end

  describe "GET #show" do
    it "assigns the requested user as @user" do
      user = FactoryGirl.create(:admin)
      get :show, {:id => user.to_param}, valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "GET #new" do
    it "assigns a new user as @user" do
      get :new, {}, valid_session
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "GET #edit" do
    it "assigns the requested user as @user" do
      user = FactoryGirl.create(:admin)
      get :edit, {:id => user.to_param}, valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Admin" do
        expect {
          post :create, {:admin => admin_valid_attributes, type: 'admin'}, valid_session
        }.to change(Admin, :count).by(1)
      end

      it "creates a new Customer" do
        expect {
          post :create, {:customer => customer_valid_attributes, type: 'customer'}, valid_session
        }.to change(Customer, :count).by(1)
      end

      it "assigns a newly created admin as @user" do
        post :create, {:admin => admin_valid_attributes, type: 'admin'}, valid_session
        expect(assigns(:user)).to be_a(Admin)
        expect(assigns(:user)).to be_persisted
      end

      it "assigns a newly created customer as @user" do
        post :create, {:customer => customer_valid_attributes, type: 'customer'}, valid_session
        expect(assigns(:user)).to be_a(Customer)
        expect(assigns(:user)).to be_persisted
      end

      it "redirects to the created user" do
        post :create, {:admin => admin_valid_attributes, type: 'admin'}, valid_session
        expect(response).to redirect_to(admin_user_url(User.last))
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        post :create, {:admin => invalid_attributes, type: 'admin'}, valid_session
        expect(assigns(:user)).to be_a_new(Admin)
      end

      it "re-renders the 'new' template" do
        post :create, {:admin => invalid_attributes, type: 'admin'}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {name: 'Updated Name', email: 'updated@email.com'}
      }

      it "updates the requested user" do
        user = FactoryGirl.create(:admin)
        put :update, {:id => user.to_param, :admin => new_attributes, type: 'admin'}, valid_session
        user.reload
        expect(user.name).to eq('Updated Name')
        expect(user.email).to eq('updated@email.com')
      end

      it "assigns the requested user as @user" do
        user = FactoryGirl.create(:admin)
        put :update, {:id => user.to_param, :admin => admin_valid_attributes, type: 'admin'}, valid_session
        expect(assigns(:user)).to eq(user)
      end

      it "redirects to the user" do
        user = FactoryGirl.create(:admin)
        put :update, {:id => user.to_param, :admin => admin_valid_attributes, type: 'admin'}, valid_session
        expect(response).to redirect_to(admin_user_url(user))
      end
    end

    context "with invalid params" do
      it "assigns the user as @user" do
        user = FactoryGirl.create(:admin)
        put :update, {:id => user.to_param, :admin => invalid_attributes, type: 'admin'}, valid_session
        expect(assigns(:user)).to eq(user)
      end

      it "re-renders the 'edit' template" do
        user = FactoryGirl.create(:admin)
        put :update, {:id => user.to_param, :admin => invalid_attributes, type: 'admin'}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested user" do
      user = FactoryGirl.create(:admin)
      expect {
        delete :destroy, {:id => user.to_param}, valid_session
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      user = FactoryGirl.create(:admin)
      delete :destroy, {:id => user.to_param}, valid_session
      expect(response).to redirect_to(admin_users_url)
    end
  end

end
