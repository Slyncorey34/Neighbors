class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new 
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else render 'new'
    end
  end

  def show
    @user = current_user
    @unit = Unit.find_by(params[:user_id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to '/'
  end

  private
  def user_params
    params.require(:user).permit(:fname, :email, :password, :unitname)
  end

end
