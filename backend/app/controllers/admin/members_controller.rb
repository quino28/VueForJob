class Admin::MembersController < AdminController
  # before_action :logged_in_member

  def index
    @members = Members.all
    render 'members/index'
  end

  def new
    render 'members/new'
  end

  def create
    @member = Members.new
    @member.name     = params[:name]
    @member.email    = params[:email]
    @member.password = params[:password]

    if @member.save
      flash[:success] = 'successed'
      redirect_to action: 'index'
    else
      render 'members/new'
    end
  end

  def show
    @member = Members.find_by(id: params[:id])
    if @member
      render 'members/show'
    else
      flash[:danger] = 'failed'
      redirect_to action: 'index'
    end
  end

  def edit
    @member = Members.find_by(id: params[:id])
    if @member
      render 'members/edit'
    else
      flash[:danger] = 'failed'
      redirect_to action: 'index'
    end
  end

  def update
    @member = Members.find(params[:id])
    @member.name  = params[:members][:name]
    @member.email = params[:members][:email]
    @member.password = params[:members][:password]

    logger.info(params[:members][:password])
    logger.info(params[:members][:password_confirmation])
    if @member.save
      flash[:success] = 'successed'
      redirect_to action: 'index'
    else
      render 'members/edit'
    end
  end

  def destroy
    @member = Members.find_by(id: params[:id])

    if @member
      @member.destroy
      flash[:success] = 'successed'
    else
      flash[:danger] = 'failed'
    end

    redirect_to action: 'index'
  end
end
