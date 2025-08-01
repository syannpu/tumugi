class MarchesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_marche, only: [:edit, :update, :destroy, :show]

  def index
    @marches = Marche.includes(:user)
  end

  def new
    @marche = Marche.new
    @atmospheres = Atmosphere.all
  end

   def create
    @marche = current_user.marches.build(marche_params)

    logger.debug("受信したparams: #{params}")
    logger.debug("marche_params: #{marche_params}")
    logger.debug("atmosphere_ids: #{marche_params[:atmosphere_ids]}")
  
  # デバッグ用：paramsの中身を確認
    logger.debug("params: #{params}")
  
    if @marche.save
      redirect_to marches_path
    else
      @atmospheres = Atmosphere.all
      render :new, status: :unprocessable_entity
    end
  end

  def show
    logger.debug("marche atmospheres: #{@marche.atmospheres.pluck(:name)}")
  end

  def edit
    @atmospheres = Atmosphere.all 
  end

  def update
    if @marche.update(marche_params)
       redirect_to marche_path(@marche), success: t('defaults.flash_message.updated', item: Marche.model_name.human)
    else
      flash.now[:danger] = t('defaults.flash_message.not_updated', item: Marche.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @marche.destroy
    redirect_to marches_path, notice: '削除しました'
  end

  private

  def set_marche
    @marche = current_user.marches.find(params[:id])

  end

  def marche_params
    params.require(:marche).permit(:title, :body, :location,{ images: []}, :start_at, :end_at, atmosphere_ids: [] )
  end
end
