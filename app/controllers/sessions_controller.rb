class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.authenticate(params[:email], params[:password])
  	if @user   		
  		session[:user_id] = @user.id
  		redirect_to user_path(@user)
  	else
  		flash[:alert] = "whoops. your email or password isn't correct. try again"
      redirect_to login_path
  	end
  end
  	
  def destroy
  	session[:user_id] = nil
  	flash[:notice] = "later, neighbor"
  	redirect_to '/'
  end
end
