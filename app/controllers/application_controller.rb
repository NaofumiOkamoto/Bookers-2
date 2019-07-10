class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  # deviseを利用する機能が実行される前に実行する

  protected  # 他のコントローラからも参照できるストロングパラメーター
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # sign_upでnameのデータ操作を許可
  end

end
