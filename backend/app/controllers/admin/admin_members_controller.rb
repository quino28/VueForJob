class Admin::AdminMembersController < AdminController
  before_action :logged_in_admin_member

  private
  def get_params
    params.require(:admin_members).permit(:name, :email, :password, :password_confirmation)
  end
end
