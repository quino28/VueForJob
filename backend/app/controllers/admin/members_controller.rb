class Admin::MembersController < AdminController
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
      redirect_to action: 'index'
    else
      render 'members/new'
    end
  end

  def show
    @member = Members.find(params[:id])
    render 'members/show'
  end

  def edit
    @member = Members.find(params[:id])
    render 'members/edit'
  end

  def update
    @member = Members.find(params[:id])
    @member.name  = params[:members][:name]
    @member.email = params[:members][:email]
    if params[:password]
      @member.password = params[:members][:password]
    end

    if @member.save
      redirect_to action: 'index'
    else
      render 'members/edit'
    end
  end

  def destroy
    @member = Members.find(params[:id])

    if @member
      @member.destroy
      flash[:success] = 'successed'
    else
      flash[:danger] = 'failed'
    end

    redirect_to action: 'index'
  end
end
