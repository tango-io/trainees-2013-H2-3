class User::PledgesController < User::BaseController
 before_filter :authenticate_user!
  def new
    @plegde = Pledge.new
  end
end
