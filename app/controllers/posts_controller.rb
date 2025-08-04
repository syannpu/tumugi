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

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
       redirect_to post_path(@post), success: t("defaults.flash_message.updated", item: Post.model_name.human)
    else
      flash.now[:danger] = t("defaults.flash_message.not_updated", item: Post.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "削除しました"
  end


  private

  def post_params
    params.require(:post).permit(:title, :body, { images: [] })
  end
end
