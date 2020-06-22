class ApplicationController < ActionController::Base
  #deviseの画面を用いる場合記述
  before_action :configure_permitted_parameters, if: :devise_controller?
  #devise版ストロングパラメータみたいなもの
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
