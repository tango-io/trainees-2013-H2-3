class Admin::BacksController < Admin::BaseController
  
  def index
    @backs = Back.all
  end

  def show 
    @back = Back.find(params[:id])
  end

  def monney_to_give
    @fee = 0.05
    @backs = Back.all
    @sum = 0
    @backs.each do |back|
      @sum += back.amount
    end
    @total_fee = @sum * @fee
    @money = @sum - @total_fee
  end

  private
  def back_params
    params.require(:back).permit(:amount, :comment, :project_id, :user_id)
  end
end
