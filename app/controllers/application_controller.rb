class ApplicationController < ActionController::Base

  #before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # deviseを利用する機能が実行される前に実行する

  def after_sign_in_path_for(resource)
    user_path(resource)
  end


  protected  # 他のコントローラからも参照できるストロングパラメーター
#-----------教材のやり方------------------
#  def configure_permitted_parameters
#    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
#    # sign_upでnameのデータ操作を許可
#  end

#-----------nameとpassでログインするやり方-------------

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end


end
