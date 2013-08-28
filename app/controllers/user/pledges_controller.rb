class User::PledgesController < User::BaseController
 before_filter :authenticate_user!
  def new
    @pledge = Pledge.new
    @user = User.new
  end
  def create
    @pledge = Pledge.new(pledge_params)
    @pledge.project_id = params[:project_id]
  end
  private
  def pledge_params
   params.require(:pledge).permit(:min,:description) 
  end
end
