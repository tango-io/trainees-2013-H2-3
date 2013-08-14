class Admin::BacksController < Admin::BaseController
  
  def index
    @backs = Back.all
  end

  def show 
    @back = Back.find(params[:id])
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
    binding.pry
    @total_fee = @sum * 0.5
    @money = @sum - @total_fee

  end

  def monney_to_give
    @fee = 0.05
    @backs = Back.all
    calculate_backs
  end

  def calculate_backs
    @sum = 0
    @new_backs = {}
    for back in @backs
      if back != nil 
        if @new_backs[back.project_id] != nil
          @new_backs[back.project_id] += back.amount
        else
          @new_backs[back.project_id] = back.amount
        end
      end
    end
    @sum = 0
    @new_backs.each{|key,sum| @sum += sum }
    @total_fee = @sum * @fee
    @money = @sum - @total_fee
  end
  
  private
  def back_params
    params.require(:back).permit(:amount, :comment, :project_id, :user_id, :created_at)
  end
end
