class BlogController < ApplicationController
  def index
    @posts = Post.published_ordered
  end

  def show
    @post = Post.find_by_id_and_draft!(params[:id], false)
  end
end
