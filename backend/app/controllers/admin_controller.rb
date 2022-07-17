class AdminController < ActionController::Base
  include SessionsHelper

  layout 'application'
  add_flash_types :success, :info, :warning, :danger

  def initial_page
    render 'layouts/index'
  end

  def index
    @models = controller_name.camelize.constantize.all.page(params[:page]).reverse_order
    render "#{controller_name}/index"
  end

  def new
    render "#{controller_name}/new"
  end

  private
  def logged_in_admin_member
    unless logged_in?
      render 'login/login'
    end
  end
end
