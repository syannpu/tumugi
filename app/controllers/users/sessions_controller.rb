# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  # GET /resource/sign_in
  def new
    super
  end
  # POST /resource/sign_in
  # def create
  #   super
  # end
  def destroy
    reset_session
    redirect_to root_path, info: "ログアウトしました"
  end
  # protected
  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [ :attribute ])
  end
end
