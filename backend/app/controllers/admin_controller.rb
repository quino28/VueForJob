class AdminController < ActionController::Base
  include SessionsHelper

  layout 'application'
  add_flash_types :success, :info, :warning, :danger

  private
  def logged_in_member
    unless logged_in?
      redirect_to login_url
    end
  end
end
