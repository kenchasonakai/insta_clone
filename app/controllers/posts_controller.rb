class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(image: params[:post][:image], caption: params[:post][:caption])
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end
end
