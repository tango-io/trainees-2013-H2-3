class User::ProjectsController < User::BaseController
  
  before_action :set_project, only: [:show,:edit,:update,:destroy]

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
      #format.json { render json: @users}
    end
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save and !params[:preview]
        format.html { redirect_to user_project_path(@project), notice: 'Project was successfully created.' } 
      else
        if params[:preview] 
          format.html {render action: "preview"}
        else
          format.html { render action: 'new' }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def edit_preview 
    render action: 'new'
  end
  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to @project, notice: "Project was successfully updated."
    else
      render "edit"
    end
  end

  def destroy
    redirect_to projects_url if @project.destroy
  end

private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit( :name, :city, :close_date, :description, :amount, :video_url,:user_id, :category_id, :approved)
  end
end
