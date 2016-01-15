require 'rails_helper'

RSpec.describe BlogController, type: :controller do

  let(:valid_admin) {
    Admin.create!(name: 'Test', surname: 'Test', cpf: '123456', phone1: '123456', email: 'test@test.com', password: '12345678')
  }

  let(:post_attributes) {
    {title: 'test01', body: '123123123', author: valid_admin, draft: false}
  }


  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      post = Post.create! post_attributes
      get :show, {id: post.id}
      expect(response).to have_http_status(:success)
    end

    it "returns http not found for unkown post" do
      post = Post.create! post_attributes
      get :show, {id: post.id + 1}
      expect(response).to have_http_status(:not_found)
      expect(response).to render_template('shared/404')
    end
  end

end
