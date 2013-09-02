class User::BacksController < User::BaseController

  def index
    @backs = Back.all
  end

  def new
    @back = Back.new
    #@current_project = Project.all
  end

  def list
    @list = current_user.backs 
    binding.pry
  end

  def show 
    @back = Back.find(params[:id])
  end

  def destroy
    redirect_to @back if @back.destroy
  end

  private
  def back_params
    params.require(:back).permit(:amount, :comment, :project_id, :user_id)
  end
end
