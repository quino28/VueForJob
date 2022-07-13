class AdminController < ActionController::Base
  include SessionsHelper

  layout 'application'
  add_flash_types :success, :info, :warning, :danger

  def index
    render 'layouts/index'
  end

  private
  def logged_in_admin_member
    unless logged_in?
      render 'login/login'
    end
  end
end
