class PostsController < ApplicationController
  before_action :set_post, only: [:show, :add_like]
  before_action :set_default_format

  def index
    @posts = Post.all
  end

  def add_like
    @new_likes = @post.likes + 1
    @post.update(likes: @new_likes)
    render :show
  end

  private
  def set_default_format
    request.format = :json
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
