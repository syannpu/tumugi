class MarchesController < ApplicationController
  before_action :authenticate_user!
  def index
    @marches = Marche.includes(:user)
  end

  def new
    @marche = Marche.new
  end

  def create
  @marche = current_user.marches.build(marche_params)
  
    if @marche.save
    redirect_to marches_path
    else
    render :new, status: :unprocessable_entity
    end
  end

  def show
    @marche = Marche.find(params[:id])
  end

  def edit
    @marche = current_user.marches.find(params[:id])
  end

  def update
    @marche = Marche.find(params[:id])
    if @marche.update(marche_params)
       redirect_to marche_path(@marche), success: t('defaults.flash_message.updated', item: Marche.model_name.human)
    else
      flash.now[:danger] = t('defaults.flash_message.not_updated', item: Marche.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @marche = Marche.find(params[:id])
    @marche.destroy
    redirect_to marches_path, notice: '削除しました'
  end

  private

  def marche_params
    params.require(:marche).permit(:title, :body, :location,{ images: []}, :start_at, :end_at )
  end
end
