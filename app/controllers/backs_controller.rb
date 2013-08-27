class BacksController < ApplicationController
  def index
  end
  def new
    @back = Back.new
  end

  def create
    @back = Back.new(back_params)
    @current_project = Project.find(@back.project_id)
    @pledge = Pledge.new
    @pledge.amount = params[:back][:option].to_i
    @pledge.project_id = @back.project_id
    if @back.save and @pledge.save
      @current_project.money_raised += @back.amount
      @current_project.save
      redirect_to @back
    else
      render 'new'
    end
  end
end
