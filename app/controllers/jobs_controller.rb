class JobsController < ApplicationController
  def index
    # @jobs = Jobs.all
  end

  def new
    @job = Job.new
    @user = current_user
  end

  def create
    @user = current_user
    @job = Job.create(job_params)
    redirect_to user_path
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
