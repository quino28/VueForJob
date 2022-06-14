class Admin::MembersController < AdminController
  def index
    render 'members/index'
  end

  def new
    render 'members/new'
  end

  def show
    render 'members/show'
  end
end
