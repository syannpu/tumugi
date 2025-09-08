class MypagesController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    render "mypage/show"
  end

  def edit
    @user = current_user
    render "mypage/edit"
  end

  def update
    current_user.assign_attributes(mypage_params)
 
    if current_user.valid?(:profile_update)
      if current_user.save
        redirect_to mypage_path, notice: 'プロフィールを更新しました'
      else
        render :edit, status: :unprocessable_entity
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def mypage_params
    params.require(:user).permit(:username, :hometown, :gender, :age, :instagram, :image, :shop_name, :products, :experience,
    :contact_info, :self_pr)
  end
end
