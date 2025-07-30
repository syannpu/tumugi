class MarchesController < ApplicationController
  before_action :authenticate_user!
  def index
    @marches = Marche.includes(:user)
  end

  def new
    @marche = Marche.new
  end

  def create
  puts "=== マルシェ作成デバッグ開始 ==="
  puts "受信したパラメータ全体: #{params.inspect}"
  puts "マルシェパラメータ: #{params[:marche]}"
  puts "画像パラメータ: #{params[:marche][:images] if params[:marche]}"
  puts "画像パラメータのクラス: #{params[:marche][:images].class if params[:marche] && params[:marche][:images]}"
  puts "ストロングパラメータ結果: #{marche_params}"
  puts "==========================="
  
  @marche = current_user.marches.build(marche_params)
  
  puts "保存前の画像数: #{@marche.images.count}"
  
    if @marche.save
    puts "保存成功！"
    puts "保存後の画像数: #{@marche.images.count}"
    redirect_to marches_path
    else
    puts "保存失敗: #{@marche.errors.full_messages}"
    render :new, status: :unprocessable_entity
    end
  end

  private

  def marche_params
    params.require(:marche).permit(:title, :body, :location, :start_at, :end_at, images: [] )
  end
end
