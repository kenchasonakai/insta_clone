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
      redirect_to posts_path, notice: '投稿を作成しました'
    else
      flash.now[:alert] = '投稿の作成に失敗しました'
      render :new
    end
  end
end
