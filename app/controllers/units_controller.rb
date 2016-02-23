class UnitsController < ApplicationController
  def index
  end

  def show
  end

  def new
  	@unit = Unit.find(params[:id])
  	@user = current_user
  end

  def create
  	# ADD fixed number of apartments and details as seeds, like Voter app
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def unit_params
  	# params.require(:unit).permit(:unitname)
  end
end
