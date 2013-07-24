class Admin::BaseController < ApplicationController
  before_filter :authenticate_user!
  before_filter :verify_admin

  private
  def verify_admin
    redirect_to root_path unless current_user.admin
  end
end
