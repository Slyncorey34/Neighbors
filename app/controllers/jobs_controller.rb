class JobsController < ApplicationController
  def index
    @user = current_user
    @jobs = Job.all 
    # ONLY SHOW JOBS OF THE CURRENT USER
  end

  def new
    @user = User.find(params[:user_id])
    @job = Job.new
  end

  def create
    @unit = Unit.find(params[:unit_id])
    @job = @unit.jobs.build(job_params)
    @job.user_id = params[:user_id]
    if @job.save
      redirect_to user_unit_jobs_path(@job.user_id,@job.unit_id)
    else 
        render :new
    end
  end


  def show
    @user = current_user
    @job = Job.find(params[:id])
  end

 def edit
  @job = Job.find(params[:id])
end

def update
  @job = Job.find(params[:id])
  if @job.update_attributes(job_params)
    p @job.user
    redirect_to user_unit_jobs_path(@job.user_id,@job.unit_id)
    # /users/:user_id/units/:unit_id/jobs(.:format) 
  else
    p @job.user
    render :edit
  end 
end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to root_path
    # /users/:user_id/units/:unit_id/jobs(.:format) 
    # /users/:user_id/units/:unit_id/jobs/:id(.:format) 
  end

  private
  def job_params
    params.require(:job).permit(:title, :note, :priority)
  end
end
