class UsersController < ApplicationController

  before_filter :authenticate_user!, except:[:index,:show]

  def index
    #
  end

  def show
    @user = User.find(params[:id])
  end

end
