class Admin::MembersController < AdminController
  def index
  end

  def show
    render 'members/show'
  end
end
