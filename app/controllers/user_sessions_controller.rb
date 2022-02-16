class UserSessionsController < ApplicationController
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
