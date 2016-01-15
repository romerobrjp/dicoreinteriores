require 'rails_helper'

RSpec.describe Admin::PostsController, type: :controller do
  include Devise::TestHelpers

  let(:invalid_attributes) {
    {title: '', body: ''}
  }

  let(:valid_session) { {} }

  before(:each) do
    sign_in FactoryGirl.create(:admin)
  end

  describe "GET #index" do
    it "assigns all posts as @posts" do
      post = FactoryGirl.create(:post)
      get :index, {}, valid_session
      expect(assigns(:posts)).to eq([post])
    end
  end

  describe "GET #show" do
    it "assigns the requested post as @post" do
      post = FactoryGirl.create(:post)
      get :show, {:id => post.to_param}, valid_session
      expect(assigns(:post)).to eq(post)
    end
  end

  describe "GET #new" do
    it "assigns a new post as @post" do
      get :new, {}, valid_session
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe "GET #edit" do
    it "assigns the requested post as @post" do
      post = FactoryGirl.create(:post)
      get :edit, {:id => post.to_param}, valid_session
      expect(assigns(:post)).to eq(post)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Admin::Post" do
        expect {
          post :create, {:post => FactoryGirl.attributes_for(:post)}, valid_session
        }.to change(Post, :count).by(1)
      end

      it "assigns a newly created post as @post" do
        post :create, {:post => FactoryGirl.attributes_for(:post)}, valid_session
        expect(assigns(:post)).to be_a(Post)
        expect(assigns(:post)).to be_persisted
      end

      it "redirects to the created post" do
        post :create, {:post => FactoryGirl.attributes_for(:post)}, valid_session
        expect(response).to redirect_to(admin_post_path(Post.last))
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved post as @post" do
        post :create, {:post => invalid_attributes}, valid_session
        expect(assigns(:post)).to be_a_new(Post)
      end

      it "re-renders the 'new' template" do
        post :create, {:post => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {title: 'Teste 02', introduction: 'INTRODUCTION 02', body: 'BODY 02 UPDATED'}
      }

      it "updates the requested post" do
        post = FactoryGirl.create(:post)
        put :update, {:id => post.to_param, :post => new_attributes}, valid_session
        post.reload
        expect(post.title).to eq('Teste 02')
        expect(post.body).to eq('BODY 02 UPDATED')
      end

      it "assigns the requested post as @post" do
        post = FactoryGirl.create(:post)
        put :update, {:id => post.to_param, :post => FactoryGirl.attributes_for(:post)}, valid_session
        expect(assigns(:post)).to eq(post)
      end

      it "redirects to the post" do
        post = FactoryGirl.create(:post)
        put :update, {:id => post.to_param, :post => FactoryGirl.attributes_for(:post)}, valid_session
        expect(response).to redirect_to(admin_post_path(post))
      end
    end

    context "with invalid params" do
      it "assigns the post as @post" do
        post = FactoryGirl.create(:post)
        put :update, {:id => post.to_param, :post => invalid_attributes}, valid_session
        expect(assigns(:post)).to eq(post)
      end

      it "re-renders the 'edit' template" do
        post = FactoryGirl.create(:post)
        put :update, {:id => post.to_param, :post => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested post" do
      post = FactoryGirl.create(:post)
      expect {
        delete :destroy, {:id => post.to_param}, valid_session
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      post = FactoryGirl.create(:post)
      delete :destroy, {:id => post.to_param}, valid_session
      expect(response).to redirect_to(admin_posts_url)
    end
  end

end
