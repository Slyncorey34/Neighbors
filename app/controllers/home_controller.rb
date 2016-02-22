class HomeController < ApplicationController
  def welcome
  end

  def lobby
  	@user = current_user
  end
  
  def contact
  end

  def faq
  end
end
