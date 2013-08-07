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
    @project = Project.find(params[:id])
    @users = User.joins(:backs).where(backs: {project_id: params[:id]})
    @owner = User.find(@project.user_id)
    respond_to do |format|
      format.html
    end
  end
  def project_time_to_close
      
  end
private

  def set_project
    @project = Project.find(params[:id])
  end

end
