class User::BacksController < User::BaseController

  def index
    @backs = Back.all
  end

  def new
    @back = Back.new
    @current_project = Project.all
  end

  def create
    @back = Back.new(back_params)
    @current_project = Project.find(@back.project_id)
    if @back.save
      @current_project.money_raised += @back.amount
      @current_project.save
      redirect_to @back
    else
      render 'new'
    end
  end

  def show 
    @back = Back.find(params[:id])
  end

  def edit
  end

  def destroy
    redirect_to @back if @back.destroy
  end

  private
  def back_params
    params.require(:back).permit(:amount, :comment, :project_id, :user_id)
  end
  def project_param
  end
end
