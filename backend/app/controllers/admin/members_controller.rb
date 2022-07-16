class Admin::MembersController < AdminController
  before_action :logged_in_admin_member
end
