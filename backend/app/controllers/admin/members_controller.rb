class Admin::MembersController < AdminController
  def index
    render 'members/index'
  end

  def new
    @member = Members.new
    render 'members/new'
  end

  def create
    @member = Members.new
    @member.name     = params[:name]
    @member.email    = params[:email]
    @member.password = params[:password]

    if @member.save
      render 'members/index'
    else
      render 'members/new'
    end
  end

  def show
    render 'members/show'
  end
end
