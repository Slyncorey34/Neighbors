class HomeController < ApplicationController
  def welcome
  end

  def lobby
  	@user = current_user
  	@post = Post.all
  end
  
  def contact
  end

  def faq
  end

  def docs
  end
end
