class UsersController < ApplicationController
  def index
    @user = User.all 
  end

  def new
    @user = User.new 
  end

  def create
    @user = User.new(user_params)
    if @user.save
      puts "saved"
      @unit = Unit.where(unitname:@user.apt).first
      @unit.user_id = @user.id
      puts 'set id'
      @unit.save  
      session[:user_id]=@user.id  
      redirect_to user_path(@user)
    else render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    if @user.admin == false
    @unit = Unit.find(@user.unit.id)
    # redirect_to lobby_path
    else
    render 'users/admin'
    end
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
    params.require(:user).permit(:fname, :email, :password, :apt, :avatar)
  end

end
