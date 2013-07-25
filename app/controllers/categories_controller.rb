class CategoriesController < ApplicationController
  def index
    @category = Category.all
    respond_to do |format|
      #format.html
      format.json { render json: @category}
    end
  end
end
