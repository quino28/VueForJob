module SessionsHelper
  def add_session(member)
    session[:member_id] = member.id
  end

  def current_member
    if session[:member_id]
      @current_member ||= Members.find_by(id: session[:member_id])
    end
  end

  def current_member?(member)
    member == current_member
  end

  def logged_in?
    !current_member.nil?
  end

  def remove_session
    session.delete(:member_id)
    @current_member = nil
  end
end
