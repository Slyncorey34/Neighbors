class UsersController < ApplicationController
  def index
    @users = User.all 
  end

  def new
    @user = User.new 
  end

  def create
    @user = User.create(user_params)
    redirect _to user_path
  end

  def show
    @user = User.find(params[:user_id])
  end

  def edit
    @user = User.find(params[:user_id])
  end

  def update
    @user = User.find(params[:user_id])
    user.update(user_params)
    redirect_to user_path
  end

  def destroy
    @user = User.find(params[:user_id])
    @user.destroy
    redirect_to user_path
  end

  private
  def user_params
    params.require(:user).permit(:fname, :email, :password, :unit)
  end

end
