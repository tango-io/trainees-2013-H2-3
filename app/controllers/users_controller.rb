class UsersController < ApplicationController

  before_filter :authenticate_user!, except:[:index,:show]

  def index
    if current_user.try(:admin?)
      redirect_to(administrators_index_path)
    end
  end

  def show
    @user = User.find(params[:id])
  end

end
