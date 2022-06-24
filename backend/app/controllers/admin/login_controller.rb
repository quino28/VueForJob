class Admin::LoginController < AdminController
  def index
    render 'login/login'
  end

  def login
    render 'members/index'
  end
end
