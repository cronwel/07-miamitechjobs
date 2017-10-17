class JobsController < ApplicationController
  before_action :find_job, only: [:show, :edit, :update, :destroy]

  def index
    if params[:category].blank?
    @jobs = Job.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @jobs = Job.where(category_id: @category_id).order("created_at DESC")
    end
  end

  def show
  end

  def new
    @job = current_user.jobs.build
  end

  def create
    @job = current_user.jobs.build(jobs_params)

    if @job.save
      redirect_to @job
    else
      render "new"
    end
  end

  def edit

  end

  def update
    if @job.update(jobs_params)
      redirect_to @job
    else
      render "Edit"
    end
  end

  def destroy
    @job.destroy
    redirect_to root_path
  end

  private

  def jobs_params
    params.require(:job).permit(:title, :description, :company, :url, :category_id)
  end

  def find_job
    @job = Job.find(params[:id])
  end

end
