class MypagesController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(mypage_params)
      redirect_to mypage_path, notice: 'プロフィールを更新しました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def mypage_params
    params.require(:user).permit(:username, :hometown, :gender, :age, :instagram, :image )
  end
end
