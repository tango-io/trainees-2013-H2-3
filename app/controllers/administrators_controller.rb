class AdministratorsController < ApplicationController
  before_filter :authenticate_user!
  def index
    unless current_user.try(:admin?)
      redirect_to(root_path)
    end
  end

  def new
  end

  def show
  end
end
