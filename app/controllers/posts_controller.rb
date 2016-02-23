class PostsController < ApplicationController
  def index
    @user = current_user
    # only accessible if a tenant or admin is logged in
    @posts = Post.all 
  end

  def new
    @user = current_user
    # How to manage people with different privileges posting?
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
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
    @post = Post.find(params[:post_id])
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post.destroy
    redirect_to tenant_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body,)
  end  
end
