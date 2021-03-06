class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    current_user.likes.create!(post: post)
    redirect_back fallback_location: posts_path
  end

  def destroy
    post = Post.find(params[:post_id])
    like = current_user.likes.find_by(post_id: post.id)
    like.destroy!
    redirect_back fallback_location: posts_path, status: :see_other
  end
end
