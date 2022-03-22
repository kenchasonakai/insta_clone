class PostsController < ApplicationController
  skip_before_action :require_login, only: %i[index]

  def index
    if current_user.present?
      @posts = Post.followed_by(current_user).order(created_at: :desc)
    else
      @posts = Post.all.order(created_at: :desc)
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(image: params[:post][:image], caption: params[:post][:caption])
    if @post.save
      redirect_to posts_path, notice: '投稿を作成しました'
    else
      flash.now[:alert] = '投稿の作成に失敗しました'
      render :new
    end
  end
end
