class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  #  This ensures that the user is redirected to a specific path on successful authentication
  def after_sign_in_path_for(_resource)
    categories_path
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
