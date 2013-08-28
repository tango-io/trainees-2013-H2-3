class User::PledgesController < User::BaseController
 before_filter :authenticate_user!
  def new
    @pledge = Pledge.new
    @user = User.new
  end
  def create
  end
  def params

  end
end
