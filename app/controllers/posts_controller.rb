class PostsController < ApplicationController
    before_action :authenticate_user!
  def index
    @posts = Post.includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

      if @post.save
        redirect_to posts_path, notice: "todoを作成されました！"
      else
        flash.now[:alert] = "タイトルを入力してください！"  # ← alertに変更
        render :new, status: :unprocessable_entity
      end
  end


  private

  def post_params
    params.require(:post).permit(:title, :body, :image )
  end
end
