class Admin::AdminMembersController < AdminController
  before_action :logged_in_admin_member

  def new
    render 'admin_members/new'
  end

  def create
    @admin_member = AdminMembers.new
    @admin_member.name     = params[:name]
    @admin_member.email    = params[:email]
    @admin_member.password = params[:password]

    if @admin_member.save
      flash[:success] = 'successed'
      redirect_to action: 'index'
    else
      render 'admin_members/new'
    end
  end

  def show
    @admin_member = AdminMembers.find_by(id: params[:id])
    if @admin_member
      render 'admin_members/show'
    else
      flash[:danger] = 'failed'
      redirect_to action: 'index'
    end
  end

  def edit
    @admin_member = AdminMembers.find_by(id: params[:id])
    if @admin_member
      render 'admin_members/edit'
    else
      flash[:danger] = 'failed'
      redirect_to action: 'index'
    end
  end

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
end
