class Mypage::JoinMarchesController < ApplicationController
  def index
    @created_marches = current_user.marches      # 作成したマルシェ
    @joined_marches = current_user.join_marches  # 参加したマルシェ（全ステータス）
  end

  def create
    marche = Marche.find(params[:marche_id])
  
  # 既に申請済み（全ステータス）かチェック
    if current_user.join_marches.exists?(marche: marche)
      redirect_to marche_path(marche), alert: '既にこのマルシェに申請済みです'
      return
    end
  
  # 出品申請の作成
    join_marche = current_user.join_marches.build(
      marche: marche,
      approval_status: :pending
    )
  
    if join_marche.save
      redirect_to mypage_join_marches_path, 
                success: '出品申請を送信しました！承認をお待ちください'
    else
      redirect_to marche_path(marche), alert: '出品申請に失敗しました'
    end
  end

  def update
    @marche = Marche.find(params[:marche_id])
    @join_marche = @marche.join_marches.find(params[:id])
    
    # セキュリティチェック：開催者のみ更新可能
    unless @marche.user == current_user
      redirect_to root_path, alert: '権限がありません'
      return
    end
    
    if @join_marche.update(join_marche_params)
      redirect_to marche_path(@marche), success: 'ステータスを更新しました'
    else
      # エラー処理
    end
  end

  def destroy
    join_marche.destroy
    redirect_to mypage_join_marches_path, notice: "参加申請を取り消しました"
  end

  private

  def join_marche
    @join_marche ||= current_user.join_marches.find(params[:id])
  end
  
  def join_marche_params
    params.require(:join_marche).permit(:approval_status)
  end
end