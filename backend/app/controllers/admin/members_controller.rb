class Admin::MembersController < AdminController
  def index
    render 'members/index'
  end

  def new
    render 'members/new'
  end

  def create
    render 'members/index'
  end

  def show
    render 'members/show'
  end
end
