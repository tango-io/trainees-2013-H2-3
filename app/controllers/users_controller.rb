class UsersController < ApplicationController
  before_filter :authenticate_user!, except:[:index,:profile]

  def index
  end

  #Show
  def profile  
    @user = User.find(params[:id]) 
  end
end
