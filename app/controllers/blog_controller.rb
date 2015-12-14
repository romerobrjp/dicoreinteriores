class BlogController < ApplicationController
  layout "blog"
  impressionist :actions => [:show]

  before_action :load_archives, :load_categories, :load_populars, only: [:index, :by_category, :by_month, :show]

  def index
    @posts = PostQuery.new.search.published_ordered.page(params.fetch(:page, 1))
  end

  def show
    @post = Post.find_by_id_and_draft!(params[:id], false)
    impressionist(@post)
  end

  def tag
    @posts = Post.tagged_with(params[:tag]).published_ordered.page(params.fetch(:page, 1))
    render 'index'
  end

  def by_category
    @posts = Post.where(category: params[:category]).page(params.fetch(:page, 1))
    render 'index'
  end

  def by_month
    @posts = PostQuery.new.search.by_month(params[:month].to_date).page(params.fetch(:page, 1))
    render 'index'
  end

  private

  def load_archives
    @archives = PostQuery.new.search.archives
  end

  def load_categories
    @categories = Category.all
  end

  def load_populars
    impressions = Impression.select(:impressionable_id).where(impressionable_type: 'Post').group(:impressionable_id).order('count(impressionable_id) DESC').distinct.limit(5)
    @populars = Post.where(:id => impressions)
  end
end
