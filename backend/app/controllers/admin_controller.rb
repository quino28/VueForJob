class AdminController < ActionController::Base
  layout 'application'
  add_flash_types :success, :info, :warning, :danger
end
