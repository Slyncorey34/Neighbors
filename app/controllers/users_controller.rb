class UsersController < ApplicationController
  def index
    @users = User.all 
  end

  def new
    @user = User.new 
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
    redirect_to user_path(@user)
    else render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to user_path
  end

  private
  def user_params
    params.require(:user).permit(:fname, :email, :password, :unitname)
  end

end