class PostsController < ApplicationController
  def index
    @user = current_user
    @posts = Post.all 
  end

  def new
    @user = current_user
   
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
    redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
 end

  def update
    @post = Post.find(params[:post_id])
    if post.update(params_params)
      @post.save
      redirect_to post_path
    else
      flash[:alert] = "whoops, try again"
    end
  end

  def show

    @post = Post.find_by(params[:user_id])
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
