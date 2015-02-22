class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  # cancancan to fix current_user error
  alias_method :current_user, :current_agent

  # cancancan to tame "access denied" error message
  rescue_from CanCan::AccessDenied do |exception|
  	redirect_to root_path, :alert => exception.message
  end

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
end
