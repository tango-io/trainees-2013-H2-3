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
    @projects = Project.all  
    @start_date = params[:s_date].to_time
    @end_date = params[:e_date].to_time
    @start_date = @start_date.to_i
    @end_date = @end_date.to_i
    @time_projects = []
    @int_array = []
    @projects.each do |project|
      integer = project.close_date.to_i
      if (integer > @start_date and integer < @end_date)
        @time_projects[project.id] = project
      end
      @int_array[project.id] = integer 
    end
    calculate_backs
  end

  def monney_to_give
    @fee = 0.05
    @time_projects = Project.all
    calculate_backs
  end

  def calculate_backs
    @time_projects
    @new_project = {}
    for project in @time_projects
      if project != nil 
        if @new_project[project.name] != nil
          @new_project[project.name] += project.money_raised
        else
          @new_project[project.name] = project.money_raised
        end
      end
    end
    @sum = 0
    @new_project.each{|key,money_raised| @sum += money_raised if money_raised !=nil }
    @total_fee = @sum * 0.5
    @money = @sum - @total_fee
  end


end
