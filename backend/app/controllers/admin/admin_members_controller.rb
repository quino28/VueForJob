class Admin::AdminMembersController < AdminController
  before_action :logged_in_admin_member

  def destroy
    @admin_member = AdminMembers.find_by(id: params[:id])

    if @admin_member
      @admin_member.destroy
      flash[:success] = 'successed'
    else
      flash[:danger] = 'failed'
    end

    redirect_to action: 'index'
  end

  private
  def new_params
    params.fetch(:admin_members, {}).permit(:name, :email, :password)
  end

  def update_params
    params.require(:admin_members).permit(:name, :email, :password)
  end
end
