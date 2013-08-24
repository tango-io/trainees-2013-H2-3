class Admin::BacksController < Admin::BaseController
  
  def index
    @backs = Back.all
  end

  def show 
    @back = Back.find(params[:id])
  end

 end
