class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy, :add_like]
  before_action :set_default_format

  def index
    @posts = Post.order(created_at: :desc)
  end

  def create
    @post = Post.create!(post_params)
    render :show, status: :created
  end

  def update
    @post.update(post_params)
    render :show
  end

  def destroy
    @post.destroy
    head :no_content
  end

  def add_like
    @new_likes = @post.likes + 1
    @post.update(likes: @new_likes)
    render :show
  end

  private
  def post_params
    params.permit(:title, :content, :author, :image)
  end

  def set_default_format
    request.format = :json
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
