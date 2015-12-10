class BlogController < ApplicationController
  def index
    @posts = Post.published_ordered.page(params.fetch(:page, 1))
  end

  def show
    @post = Post.find_by_id_and_draft!(params[:id], false)
  end

  def tag
    @posts = Post.tagged_with(params[:tag]).published_ordered.page(params.fetch(:page, 1))
    render 'index'
  end
end