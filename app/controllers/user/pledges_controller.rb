class User::PledgesController < User::BaseController
 before_filter :authenticate_user!
  def new
    @pledge = Pledge.new
    @user = User.new
  end
  def create
    @pledge = Pledge.new(pledge_params)
    @pledge.project_id = params[:project_id]
    if @pledge.save
      redirect_to :back
      flash[:notice] = "Pledge Saved!"
    else
      redirect_to :back
      flash[:notice] = "Error Saving Pledge"
    end
  end
  private
  def pledge_params
   params.require(:pledge).permit(:min,:description) 
  end
end
