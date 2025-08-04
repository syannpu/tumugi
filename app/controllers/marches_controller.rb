class MarchesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_marche, only: [ :edit, :update, :destroy, :show ]

  def index
    @search = Marche.ransack(params[:q])
    @marches = @search.result.includes(:atmospheres, :targets, :prices, :user)
  end

  def new
    @marche = Marche.new
    @atmospheres = Atmosphere.all
    @targets = Target.all
    @prices = Price.all
  end

  def create
    @marche = current_user.marches.build(marche_params)

    if @marche.save
      redirect_to marches_path
    else
      @atmospheres = Atmosphere.all
      @targets = Target.all
      @prices = Price.all
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @marche = Marche.find(params[:id])
    @search = Marche.ransack(params[:q]) 
  end

  def edit
    @atmospheres = Atmosphere.all
    @targets = Target.all
    @prices = Price.all
  end

  def update
    if @marche.update(marche_params.except(:images))
      if params[:marche][:images].present?
      # 既存の画像を保持しつつ、新しい画像を追加
        new_images = params[:marche][:images].reject(&:blank?)
        @marche.images = @marche.images + new_images  # 既存 + 新規
        @marche.save
      end
      redirect_to @marche, notice: 'マルシェが更新されました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @marche.destroy
    redirect_to marches_path, notice: "削除しました"
  end

  private

  def set_marche
    @marche = current_user.marches.find(params[:id])
  end

  def marche_params
    params.require(:marche).permit(:title, :body, :location, { images: [] }, :start_at, :end_at, atmosphere_ids: [], target_ids: [], price_ids: [])
  end
end
