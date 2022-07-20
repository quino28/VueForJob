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

  def show
    @model = controller_name.camelize.constantize.find_by(id: params[:id])
    if @model
      render "#{controller_name}/show"
    else
      flash[:danger] = 'failed'
      redirect_to action: 'index'
    end
  end

  def create
    @model = controller_name.camelize.constantize.new(new_params)

    if @model.save
      flash[:success] = 'successed'
      redirect_to action: 'index'
    else
      render "#{controller_name}/new"
    end
  end

  def edit
    @model = controller_name.camelize.constantize.find_by(id: params[:id])
    if @model
      render "#{controller_name}/edit"
    else
      flash[:danger] = 'failed'
      redirect_to action: 'index'
    end
  end

  private
  def logged_in_admin_member
    unless logged_in?
      render 'login/login'
    end
  end
end
