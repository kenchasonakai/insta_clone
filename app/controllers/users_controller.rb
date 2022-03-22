class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create show]

  def index
    @users = User.where.not(id: User.first.followings.pluck(:id).push(User.first.id))
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, notice: 'ユーザーを作成しました'
    else
      flash.now[:alert] = 'ユーザーの作成に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find_by(username: params[:username])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(username: current_user.username)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :fullname, :username, :password, :icon, :introduction)
  end
end
