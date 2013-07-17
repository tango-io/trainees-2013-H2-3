class UsersController < ApplicationController
  before_filter :authenticate_user!, except:[:index,:profile]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
