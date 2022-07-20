class Admin::AdminMembersController < AdminController
  before_action :logged_in_admin_member

  def update
    @admin_member = AdminMembers.find(params[:id])
    @admin_member.name     = params[:admin_members][:name]
    @admin_member.email    = params[:admin_members][:email]
    @admin_member.password = params[:admin_members][:password]

    if @admin_member.save
      flash[:success] = 'successed'
      redirect_to action: 'index'
    else
      render 'admin_members/edit'
    end
  end

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
end
