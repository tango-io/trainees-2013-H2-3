class Admin::ProjectsController < Admin::BaseController
  def index
    @projects = Project.all
    respond_to do |format|
      format.html
      format.json { render json: @projects}
    end
  end
  def approve
    @project = Project.find(params[:id])
    @project.approve!
    redirect_to projects_url
  end

  def destroy
    redirect_to projects_url if @project.destroy
  end
end
