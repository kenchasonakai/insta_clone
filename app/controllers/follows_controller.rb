class FollowsController < ApplicationController
  def create
    current_user.follow_relationships.create(to_user_id: params[:user_id])
    redirect_back fallback_location: root_path
  end

  def destroy
    current_user.follow_relationships.find_by(to_user_id: params[:id]).destroy
    redirect_back fallback_location: root_path, status: :see_other
  end
end
