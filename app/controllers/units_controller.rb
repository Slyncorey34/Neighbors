class UnitsController < ApplicationController
  def index
    
    @units = Unit.all
  end

  def show
  end

  def new
  	@unit = Unit.new(unit_params)
  	@user = current_user
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def unit_params
  	params.require(:unit).permit(:unitname)
  end
end
