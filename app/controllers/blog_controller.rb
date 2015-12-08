class BlogController < ApplicationController
  layout "blog"

  def index
    @archives = Post.order(created_at: :desc).limit(5).each
    # @archives = PostQuery.new.search.archives
    @categories = Category.all
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