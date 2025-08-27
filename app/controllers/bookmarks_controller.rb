class BookmarksController < ApplicationController
   before_action :authenticate_user!
   before_action :set_marche, only: [ :create, :destroy ]

  def create 
    current_user.bookmark(@marche)
    redirect_to @marche, notice: "ブックマークしました！"
  end

  def destroy
    bookmark = current_user.bookmarks.find(params[:id])
    bookmark.destroy
    redirect_to bookmark.marche, notice: "ブックマークを解除しました"
  end

  private

  def set_marche
    @marche = Marche.find(params[:marche_id])  
  end
end
