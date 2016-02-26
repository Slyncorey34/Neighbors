class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :current_user
  helper_method :admin?
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def admin?
  	current_user.admin == true
  end
end

    # if @user.admin = 'false'
      # find user's unitid,
    # @user = User.find(params[:id])
    # if @user.admin == 'false'
    # @unit = Unit.find(@user.unit.id)
  #    redirect_to lobby_path
  #    else redirect_to posts_path
  # end

  # user logs in, directed to their profile page (user_path(@user))
  # if the user is the landlord/admin, direct them to the admin's show page...or lobby?
  # create special erbs for landlord