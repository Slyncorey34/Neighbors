class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.authenticate(params[:email], params[:password])
  	if @user
  		# if user exists and logs in, session is created and user goes to their 
  		session[:user_id] = @user_id
  		redirect_to user_path(@user)
  	else
  		flash[:alert] = "whoops. your email or password isn't correct. try again"
  	end
  end
  	
  def destroy
  	session[:user_id] = nil
  	flash[:notice] = "later, neighbor"
  	redirect_to '/'
  end
end
