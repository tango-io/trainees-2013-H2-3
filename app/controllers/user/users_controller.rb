class User::UsersController < User::BaseController

  before_filter :authenticate_user!, except:[:index]

  def index
    unless current_user == nil
      redirect_to administrators_path if current_user.admin
    end
  end

  def show
    @user = User.find(params[:id])
  end

end

