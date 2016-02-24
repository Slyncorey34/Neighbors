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
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def show

    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body,)
  end  
end
