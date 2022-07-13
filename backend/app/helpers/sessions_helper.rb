module SessionsHelper
  def add_session(admin_member)
    session[:admin_member_id] = admin_member.id
  end

  def current_admin_member
    if session[:admin_member_id]
      @current_admin_member ||= AdminMembers.find_by(id: session[:admin_member_id])
    end
  end

  def current_admin_member?(admin_member)
    admin_member == current_admin_member
  end

  def logged_in?
    !current_admin_member.nil?
  end

  def remove_session
    session.delete(:admin_member_id)
    @current_admin_member = nil
  end
end
