class PostsController < ApplicationController
  before_action :set_post, only: [:show, :add_like]

  def index
    @posts = Post.all
    render json: @posts, status: :ok
  end

  def show
    render json: @post, status: :ok
  end

  def add_like
    @new_likes = @post.likes + 1
    @post.update(likes: @new_likes)
    render json: @post, status: :ok
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end
end
