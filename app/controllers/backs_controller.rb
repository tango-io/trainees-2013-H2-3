class BacksController < ApplicationController

  def index
    @backs = Back.all
  end

  def new
    @back = Back.new
  end

  def create
    @back = Back.new(back_params)

    if @back.save
      redirect_to @back
    else
      render 'new'
    end
  end

  def show 
    @back = Back.find(params[:id])
  end

  def edit
  end

  def update
    if @back.update(back_params)
      redirect_to @back
    else
      render 'new'
    end
  end

  def destroy
    @back.destroy
    redirect_to @back
  end

  private
  def back_params
    params.require(:back).permit(:amount, :comment, :project_id, :user_id)
  end
end
