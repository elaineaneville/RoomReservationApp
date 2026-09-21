class ApplicationController < ActionController::Base
  helper_method :current_user

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def require_authenticated_user
    return if current_user

    redirect_to login_path, alert: "Please sign in to continue."
  end

  def require_admin_user
    return if current_user&.admin?

    redirect_to root_path, alert: "Admin access is required."
  end
end
