class Admin::LoginController < AdminController
  def index
    render 'login/login'
  end

  def login
    member = Members.find_by(email: params[:email].downcase)
    if member && member.authenticate(params[:password])
      add_session member
      redirect_to admin_path
    else
      redirect_to action: 'index'
    end
  end

  def logout
    remove_session if logged_in?
    redirect_to action: 'index'
  end
end
