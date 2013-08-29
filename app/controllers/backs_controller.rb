class BacksController < ApplicationController
  def index
  end
  def new
    @back = Back.new
    @pledge = Pledge.where(:project_id => params[:project_id])
  end

  def create
    @back = Back.new(back_params)
    @current_project = Project.find(params[:project_id])
    @back.user_id = current_user
    @back.project_id = params[:project_id]
    if @back.save
      if @current_project.money_raised != nil
        @current_project.money_raised += @back.amount
      else
        @current_project.money_raised = @back.amount
      end
      @current_project.save
      redirect_to project_backs_path(@current_project.id)
    else
      render @back 
    end
  end

  private
  def back_params
    params.require(:back).permit(:amount,:pledge_id)
  end
end
