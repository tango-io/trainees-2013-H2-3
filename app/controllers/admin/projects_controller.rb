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

  def monney_to_give_betwen_dates
    @projects = Project.list_project_between(params[:s_date].to_date,params[:e_date].to_date)
    #calculate_backs
  end

  def monney_to_give
    @fee = 0.05
    @time_projects = Project.all
    ##calculate_backs
  end
end
