class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?
  include DeviseTokenAuth::Concerns::SetUserByToken

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email password name nickname role])
  end

  rescue_from CanCan::AccessDenied do |_exception|
    render json: { message: 'Access denied' }, status: :unauthorized
  end
end
