class JobsController < ApplicationController
  def index
      # ONLY SHOW JOBS OF THE CURRENT USER 
     @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save
      redirect_to user_path(@user)
    else 
        render :new
    end
  end


  def show
    @job = Job.find(params[:id])
  end

 def edit
  @job = Job.find(params[:id])
end

def update
  @job = Job.find(params[:id])
  if @job.update_attributes(job_params)
 
    p @job.user
    redirect_to job_path(@job)
  else
    p @job.user
    render :edit
  end 
end

  def destroy
  end

  private
  def job_params
    params.require(:job).permit(:title, :note)
  end
end
