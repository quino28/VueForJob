class Admin::LoginController < AdminController
  def index
    render 'login/login'
  end

  def login
    member = Members.find_by(email: params[:email].downcase)
    logger.info(member.inspect)
    logger.info(params[:password])
    member.password = 'admin'
    logger.info(member.authenticate(params[:password]))
    if member && member.authenticate(params[:password])
      # log_in member
      redirect_to controller: :members, action: :index
    else
      render 'login/login'
    end
  end

  def logout
    log_out if logged_in?
    redirect_to root_url
  end
end
