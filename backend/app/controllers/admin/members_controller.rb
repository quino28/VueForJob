class Admin::MembersController < AdminController
  before_action :logged_in_admin_member

  private
  def get_params
    params.require(:members).permit(
      :name,
      :email,
      :birthday,
      :gender,
      :password,
      :password_confirmation
    )
  end
end
