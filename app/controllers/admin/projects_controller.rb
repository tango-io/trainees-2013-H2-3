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

  def monney_to_give
    unless params[:s_date].nil?
      @projects = Project.list_project_between(params[:s_date].to_date,params[:e_date].to_date)
      @money = Project.successful.sum('money_raised')
    else
      @projects = Project.all.order('id ASC').non_successful    ##calculate_backs
      @money = Project.successful.sum('money_raised')
    end
  end
end
