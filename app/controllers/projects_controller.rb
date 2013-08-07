class ProjectsController < ApplicationController
  
  before_action :set_project, only: [:show]

  def index
    @projects = Project.all

    respond_to do |format|
      format.html
      format.json { render json: @projects}
    end
  end

  def show
    flash[:notice] = ""
    @project = Project.find(params[:id])
    @users = User.joins(:backs).where(backs: {project_id: params[:id]})
    @owner = User.find(@project.user_id)
    project_time_to_close
    date_to_close
    respond_to do |format|
      format.html
    end
  end
  def project_time_to_close
    @project = Project.find(params[:id])
    @time_now = Time.now
    if @time_now >= @project.close_date
      flash[:notice] = "The Project was Closer"
      @close_date = 1
    else
      @close_date = 0
    end
  end

  def date_to_close
    @project  = Project.find(params[:id])
    @date_finish = Date.parse("#{@project.close_date}")
    @date_now = Date.today
    @time_to_finish = (@date_finish - @date_now).to_i
    @time_to_finish = 0 if @time_to_finish <= 0
  end
private

  def set_project
    @project = Project.find(params[:id])
  end

end
