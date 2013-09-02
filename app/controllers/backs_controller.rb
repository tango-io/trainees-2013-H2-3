class BacksController < ApplicationController
  def index
  end
  def new
    @back = Back.new
    @pledge = Pledge.where(:project_id => params[:project_id])
  end

  def create
    @back = current_user.backs.new(back_params)
    @back.project_id = params[:project_id]
    if @back.save
      Project.find(params[:project_id]).sum_money(@back.amount)
      redirect_to :back
    else
      render :back
    end
  end

  private
  def back_params
    params.require(:back).permit(:amount,:pledge_id)
  end
end
