class PostsController < ApplicationController
  def index
    @posts = Post.all 
    @user = current_user
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post].permit(:title,:body))
    @post.save
    redirect_to posts_path
  end

  def edit
    @post= Post.find(params[:post_id])
 end

  def update
    @post = Post.find(params[:post_id])
    if post.update(params_params)
      post.save
      redirect_to post_path
    else
      flash[:alert] = "whoops, try again"
    end
  end

  def show
    # @user = current_user
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to tenant_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body,)
  end  
end
