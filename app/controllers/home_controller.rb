class HomeController < ApplicationController
  def welcome
    # render :template => "home/welcome"
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
    # respond_to do |format|
    # format.html
    # format.pdf do
    #   render :pdf         => "file_name",
    #          :layout      => "/layouts/print_layout.html.erb"
    # end
    # end
  end
end
