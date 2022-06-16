class Admin::MembersController < AdminController
  def index
    render 'members/index'
  end

  def new
    render 'members/new'
  end

  def create
    m = Members.new
    m.name     = params[:name]
    m.email    = params[:email]
    m.password = params[:password]
    m.save

    render 'members/index'
  end

  def show
    render 'members/show'
  end
end
