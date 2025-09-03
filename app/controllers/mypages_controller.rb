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
    @user = current_user
    if @user.update(mypage_params)
      redirect_to mypage_path, notice: "プロフィールを更新しました"
    else
    # より確実な出力方法
      puts "=== エラー内容 ==="
      puts @user.errors.full_messages
      puts "=================="
     
    # ログにも出力
      Rails.logger.error "バリデーションエラー: #{@user.errors.full_messages}"
    
      render "mypage/edit", status: :unprocessable_entity
    end
  end

  private

  def mypage_params
    params.require(:user).permit(:username, :hometown, :gender, :age, :instagram, :image, :shop_name, :products, :experience,
    :contact_info, :self_pr)
  end
end
