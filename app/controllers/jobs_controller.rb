class JobsController < ApplicationController
  def index
      
     @jobs = Job.all
  end

  def new
    @job = Job.new
    @user = current_user
  end

  def create
    @user = current_user
    @job = Job.create(job_params)
    

  # @unit= Unit.find(params[:id])
  #   @job = @unit.jobs.build(job_params)
  #   @job.user = current_user
    if @job.save
      redirect_to user_path(@user)
    else 
        render :new
    end
  end


  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def job_params
    params.require(:job).permit(:type, :note)
  end
end
