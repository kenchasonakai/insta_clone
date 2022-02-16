class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to(:root, notice: 'ログインしました')
    else
      flash.now[:alert] = 'ログインに失敗しました'
      render action: 'new', status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to(:root, notice: 'ログアウトしました')
  end
end
