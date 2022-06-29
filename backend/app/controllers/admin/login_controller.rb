class Admin::LoginController < AdminController
  def index
    render 'login/login'
  end

  def login
    member = Members.find_by(email: params[:email].downcase)
    if member && member.authenticate(params[:password])
      # log_in member
      redirect_to controller: :members, action: :index
    else
      render 'layouts/index'
    end
  end

  def logout
    log_out if logged_in?
    redirect_to root_url
  end
end
