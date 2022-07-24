class Admin::MembersController < AdminController
  before_action :logged_in_admin_member

  private
  def get_params
    params.permit(
      :name,
      :email,
      :birthday,
      :gender,
      :password,
      :password_confirmation
    )
  end
end
