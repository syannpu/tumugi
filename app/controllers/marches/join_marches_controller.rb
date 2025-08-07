class Marches::JoinMarchesController < ApplicationController
  def index
    @marche = Marche.find(params[:marche_id])
    @join_marches = @marche.join_marches
  end
  
  def update
    @marche = Marche.find(params[:marche_id])
    @join_marche = @marche.join_marches.find(params[:id])
    
    if @join_marche.update(join_marche_params)
      redirect_to marche_join_marches_path(@marche), notice: '参加状況を更新しました'
    else
      redirect_to marche_join_marches_path(@marche), alert: '更新に失敗しました'
    end
  end
  
  private
  
  def join_marche_params
    params.require(:join_marche).permit(:approval_status) 
  end
end
