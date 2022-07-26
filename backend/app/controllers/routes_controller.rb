class RoutesController < ActionController::Base
  def not_found
    raise ActionController::RoutingError, params[:path]
  end
end
