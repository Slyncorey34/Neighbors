class UnitsController < ApplicationController
  def index
    
    @units = Unit.all
  end

  def show
    @user = current_user
    if @user.admin == true
    @unit = Unit.find(params[:id])
    # end
    # # respond_to do |format|
    # #   format.html
    #   format.pdf do
    #     @example_text = "some text"
    #     render pdf: "file_name",
    #     :template => 'units/lease_show.pdf.erb',
    #     :layout => 'pdf',
    #     :footer => {
    #       :center => "Center",
    #       :left => "Left",
    #       :right => "Right"
    #     }   # Excluding ".pdf" extension.
    #   end
    end
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
