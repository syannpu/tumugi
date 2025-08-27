class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [ :create, :destroy ]

  def index
    @liked_posts = current_user.liked_posts
  end

  def create
    current_user.like(@post)
    redirect_to @post, notice: "いいねしました！"
  end

  def destroy
    current_user.unlike(@post)
    redirect_to @post, notice: "いいねを解除しました。"
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
