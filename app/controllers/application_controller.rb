class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:surname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:read_surname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:read_first_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:birthday])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:password])
  end
end
