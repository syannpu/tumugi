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
        redirect_to marches_path, notice: "todoを作成されました！"
      else
        flash.now[:alert] = "タイトルを入力してください！"  # ← alertに変更
        render :new, status: :unprocessable_entity
      end
  end


  private

  def marche_params
    params.require(:marche).permit(:title, :body, :location, :image, :start_at, :end_at )
  end
end
