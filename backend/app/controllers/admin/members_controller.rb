class Admin::MembersController < AdminController
  def index
    render 'members/index'
  end

  def show
    render 'members/show'
  end
end
