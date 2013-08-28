class BacksController < ApplicationController
  def index
  end
  def new
    @back = Back.new
    @pledge = Pledge.where(:project_id => params[:project_id])
  end

  def create
    @back = Back.new
    @current_project = Project.find(params[:project_id])
    @back.user_id = current_user
    if @back.save
      if @back.amount != nil
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
    params.require(:back).permit(:amount)
  end
end
