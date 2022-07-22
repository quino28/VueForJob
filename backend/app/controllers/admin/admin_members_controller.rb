class Admin::AdminMembersController < AdminController
  before_action :logged_in_admin_member

  private
  def new_params
    params.fetch(:admin_members, {}).permit(:name, :email, :password)
  end

  def update_params
    params.require(:admin_members).permit(:name, :email, :password)
  end
end
